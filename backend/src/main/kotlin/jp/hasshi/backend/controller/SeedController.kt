package jp.hasshi.backend.controller

import jp.hasshi.backend.controller.request.PostSeedRequest
import jp.hasshi.backend.controller.response.GetSeedResponse
import jp.hasshi.backend.model.Seed
import jp.hasshi.backend.model.Tag
import jp.hasshi.backend.service.SeedService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/seeds")
class SeedController(private val seedService: SeedService) {
    @GetMapping
    fun get(): List<GetSeedResponse> {
        return seedService.get().map {
            GetSeedResponse(
                id = it.id,
                username = it.username,
                text = it.text,
                favorite = it.favorite,
                comment = it.comment,
                tag = it.tag,
            )
        }
    }

    @PostMapping
    fun post(@RequestBody body: PostSeedRequest): String {
        seedService.post(
            Seed(
                username = "name",
                text = body.text,
                favorite = 29,
                comment = 4,
                tag = Tag.help
            )
        )
        return body.text
    }
}