package hello

import java.util.UUID
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
class Customer {
	@Accessors
	var String firstName

	@Accessors
	var String lastName

	// No setter. JPA will inject the field directly
	@Accessors(PUBLIC_GETTER)
	@Column(columnDefinition="BINARY(16)")
	@Id UUID id

	// default constructor
	new() {
		this(UUID::randomUUID)
	}

	// you might want to create a customer with a specific id.
	new(UUID id) {
		this.id = id
	}
}
