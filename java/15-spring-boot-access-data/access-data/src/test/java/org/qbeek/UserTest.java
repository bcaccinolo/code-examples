package org.qbeek;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class UserTest {
    @Test
    void testLombokGettersAndSetters() {
        User user = new User();

        String name = "my name";
        user.setName(name);
        assertEquals(user.getName(), name);

        String email = "test@test.com";
        user.setEmail(email);
        assertEquals(user.getEmail(), email);
    }
}
