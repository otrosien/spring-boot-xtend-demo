package hello

import org.springframework.boot.CommandLineRunner
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import java.util.UUID

@SpringBootApplication
class Application {

	def static void main(String[] args) {
		SpringApplication.run(Application, args)
	}

	@Bean
	def CommandLineRunner init(CustomerRepository repository) {
		[
			initData(repository)
			reportData(repository)
		]
	}

	private def reportData(CustomerRepository repository) {
		println('''
		
		Customers found with findAll():
		-------------------------------''')
		repository.findAll().forEach [
			println('''«id»: «firstName» «lastName»''')
		]

		repository.findOne(UUID::fromString('f2fe9532-4021-418a-80e3-9bcc5229390a')) => [
			println('''
			
			Customer found with findOne('«id»'):
			-------------------------------- 
			«id»: «firstName» «lastName»''')
		]

		println('''
		
		Customers found with findByLastName('Bauer'):
		--------------------------------------------''')
		repository.findStreamedByLastName('Bauer').forEach [
			println('''«id»: «firstName» «lastName»''')
		]
	}

	private def initData(CustomerRepository repository) {
		repository.save(new Customer => [
			firstName = 'Jack';
			lastName = 'Bauer'
		])
		repository.save(new Customer => [
			firstName = 'Chloe';
			lastName = "O'Brian"
		])
		repository.save(new Customer => [
			firstName = 'Kim';
			lastName = 'Bauer'
		])
		repository.save(new Customer => [
			firstName = 'David';
			lastName = 'Palmer'
		])
		// create a customer with a fixed UUID:
		repository.save(new Customer(UUID::fromString('f2fe9532-4021-418a-80e3-9bcc5229390a')) => [
			firstName = 'Michelle';
			lastName = 'Dessler'
		])
	}

}
