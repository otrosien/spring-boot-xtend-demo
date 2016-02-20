package hello

import com.fasterxml.jackson.databind.ObjectMapper
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.SpringApplicationConfiguration
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner
import org.springframework.test.context.web.WebAppConfiguration
import org.springframework.test.web.servlet.MockMvc
import org.springframework.web.context.WebApplicationContext

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*

@RunWith(SpringJUnit4ClassRunner)
@SpringApplicationConfiguration(Application)
@WebAppConfiguration
class ApplicationTest {

	@Autowired
	WebApplicationContext wac;

	MockMvc mockMvc

	extension ObjectMapper jsonWriter = new ObjectMapper()

	@Before
	def void setup() {
		mockMvc = webAppContextSetup(wac).build()
	}

	@Test
	@SuppressWarnings("unchecked")
	def void testImportCustomer() {
		mockMvc.perform(
			put('/customers/169cffd1-cac5-4c1e-a98b-c7277c6c71bc') //
			.content( //
				writeValueAsString(#{
					'firstName' -> 'John',
					'lastName'  -> 'Tucker'
				})
			))
			.andExpect(status.created)
	}
}
