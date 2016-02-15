package hello

import org.springframework.data.repository.CrudRepository
import java.util.UUID

interface CustomerRepository extends CrudRepository<Customer, UUID> {
    def Iterable<Customer> findByLastName(String lastName)
}