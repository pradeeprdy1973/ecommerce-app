package com.ecommerce.controller;

import com.ecommerce.dto.AddToCartRequest;
import com.ecommerce.dto.CartDTO;
import com.ecommerce.dto.MessageResponse;
import com.ecommerce.entity.User;
import com.ecommerce.repository.UserRepository;
import com.ecommerce.service.CartService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cart")
@Tag(name = "Cart", description = "Shopping cart endpoints")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    @Operation(summary = "Get user cart", description = "Get current user's shopping cart")
    public ResponseEntity<CartDTO> getCart(Authentication authentication) {
        User user = getUserFromAuthentication(authentication);
        CartDTO cart = cartService.getCartByUserId(user.getId());
        return ResponseEntity.ok(cart);
    }

    @PostMapping("/add")
    @Operation(summary = "Add to cart", description = "Add product to shopping cart")
    public ResponseEntity<CartDTO> addToCart(
            @Valid @RequestBody AddToCartRequest request,
            Authentication authentication) {
        User user = getUserFromAuthentication(authentication);
        CartDTO cart = cartService.addToCart(user.getId(), request);
        return ResponseEntity.ok(cart);
    }

    @PutMapping("/items/{itemId}")
    @Operation(summary = "Update cart item", description = "Update quantity of cart item")
    public ResponseEntity<CartDTO> updateCartItem(
            @PathVariable Long itemId,
            @RequestParam Integer quantity,
            Authentication authentication) {
        User user = getUserFromAuthentication(authentication);
        CartDTO cart = cartService.updateCartItem(user.getId(), itemId, quantity);
        return ResponseEntity.ok(cart);
    }

    @DeleteMapping("/items/{itemId}")
    @Operation(summary = "Remove from cart", description = "Remove item from shopping cart")
    public ResponseEntity<MessageResponse> removeFromCart(
            @PathVariable Long itemId,
            Authentication authentication) {
        User user = getUserFromAuthentication(authentication);
        cartService.removeFromCart(user.getId(), itemId);
        return ResponseEntity.ok(new MessageResponse("Item removed from cart"));
    }

    @DeleteMapping("/clear")
    @Operation(summary = "Clear cart", description = "Remove all items from shopping cart")
    public ResponseEntity<MessageResponse> clearCart(Authentication authentication) {
        User user = getUserFromAuthentication(authentication);
        cartService.clearCart(user.getId());
        return ResponseEntity.ok(new MessageResponse("Cart cleared"));
    }

    private User getUserFromAuthentication(Authentication authentication) {
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }
}
