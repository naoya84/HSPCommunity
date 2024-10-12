package jp.hasshi.backend.service

import jp.hasshi.backend.model.Seed
import jp.hasshi.backend.model.Tag
import jp.hasshi.backend.repository.SeedRepository
import org.springframework.stereotype.Service

@Service
interface SeedService {
    fun get(): List<Seed>
    fun post(body: Seed)
}

class SeedServiceImpl(private val seedRepository: SeedRepository) : SeedService {
    override fun get(): List<Seed> {
        return listOf(
            Seed(
                id = 1,
                username = "繊細さんA",
                text = "困っています。",
                favorite = 1,
                comment = 4,
                tag = Tag.help
            ),
            Seed(
                id = 2,
                username = "繊細さんB",
                text = "困りはてています。",
                favorite = 9,
                comment = 1,
                tag = Tag.tweet
            ),
            Seed(
                id = 3,
                username = "繊細さんC",
                text = "困りはてています。",
                favorite = 9,
                comment = 1,
                tag = Tag.tweet
            ),
            Seed(
                id = 4,
                username = "繊細さんD",
                text = "困りはてています。",
                favorite = 9,
                comment = 1,
                tag = Tag.help
            )
        ) //TODO: Repositoryからfind * toModel
    }

    override fun post(body: Seed) {
        seedRepository.save(
            body.toEntity()
        )
    }
}