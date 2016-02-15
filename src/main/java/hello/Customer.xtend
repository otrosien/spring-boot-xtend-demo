package hello

import java.util.UUID
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Customer {
    var String firstName
    var String lastName
    @Column(columnDefinition = "BINARY(16)")
    @Id UUID id = UUID::randomUUID

}