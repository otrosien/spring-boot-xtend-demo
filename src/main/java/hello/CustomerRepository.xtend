package hello

import java.util.UUID
import java.util.stream.Stream
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.rest.core.annotation.RestResource
import org.springframework.stereotype.Repository

@Repository
interface CustomerRepository extends JpaRepository<Customer, UUID> {

    def Page<Customer> findPagedByLastName(String lastName, Pageable pageable)

    @RestResource(exported=false)
    def Stream<Customer> findStreamedByLastName(String lastName)

}