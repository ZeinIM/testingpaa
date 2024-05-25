using m7.Models;
using m7_paa;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace m7.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        [HttpGet(Name = "Get All User")]
        public IEnumerable<Person> Get()
        {
            return Person.people;
        }

        [HttpGet("{id}", Name = "Get User by Id")]
        public IActionResult Get(int id)
        {
            Person? foundPerson = Person.people.FirstOrDefault(x => x.Id == id);
            if (foundPerson == null)
            {
                return NotFound();
            }
            return Ok(foundPerson);
        }



        [HttpGet("detail/{id}", Name = "Get User Detail By Id")]
        public async Task<ActionResult> GetDetail(int id)
        {
            Person? foundPerson = Person.people.FirstOrDefault(x => x.Id == id);
            if (foundPerson == null)
            {
                return NotFound();
            }

            PersonDetail personDetail = new PersonDetail
            {
                Id = foundPerson.Id,
                Name = foundPerson.Name,
                Age = foundPerson.Age,
                Detail = null
            };

            using (HttpClient client = new HttpClient())
            {
                string url = $"https://dummy-user-tan.vercel.app//{id}";
                HttpResponseMessage response = await client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    PersonDetailFromAPI? personDetailFromAPI = JsonConvert.DeserializeObject<PersonDetailFromAPI>(jsonResponse);

                    if (personDetailFromAPI != null)
                    {
                        personDetail.Detail = new Detail
                        {
                            Saldo = personDetailFromAPI.Saldo,
                            Hutang = personDetailFromAPI.Hutang
                        };
                    }
                }
            }

            return Ok(personDetail);
        } 
        
    }
}