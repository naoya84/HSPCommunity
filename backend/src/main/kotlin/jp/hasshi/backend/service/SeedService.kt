package jp.hasshi.backend.service

import jp.hasshi.backend.model.Seed
import jp.hasshi.backend.repository.SeedRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

interface SeedService {
    fun get(): List<Seed>
    fun post(body: Seed)
    fun addFavorite(seedId: Int): List<Seed>
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

    @Transactional
    override fun addFavorite(seedId: Int): List<Seed> {
        val seedEntity = seedRepository.findById(seedId.toLong()).get()
        seedEntity.favorite += 1
        seedRepository.save(seedEntity)
        return seedRepository.findAll().map { it.toModel() }
    }
}