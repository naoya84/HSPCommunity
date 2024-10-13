package jp.hasshi.backend.service

import jp.hasshi.backend.model.Seed
import jp.hasshi.backend.repository.SeedRepository
import org.springframework.stereotype.Service

interface SeedService {
    fun get(): List<Seed>
    fun post(body: Seed)
}

@Service
class SeedServiceImpl(private val seedRepository: SeedRepository) : SeedService {
    override fun get(): List<Seed> {
        return seedRepository.findAll().map { it.toModel() }
    }

    override fun post(body: Seed) {
        seedRepository.save(
            body.toEntity()
        )
    }
}