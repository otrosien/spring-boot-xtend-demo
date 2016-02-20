package hello

import java.util.UUID
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import com.google.common.annotations.VisibleForTesting

@Entity
class Customer {
    @Accessors
    var String firstName

    @Accessors
    var String lastName

    // No setter. JPA will inject the field directly
    @Accessors(PUBLIC_GETTER)
    @Column(columnDefinition = "BINARY(16)")
    @Id UUID id = UUID::randomUUID

	// default constructor
	new(){}

	// you might want to create a customer with a specific id.
	@VisibleForTesting
	package new(UUID id) {
		this.id = id
	}
}