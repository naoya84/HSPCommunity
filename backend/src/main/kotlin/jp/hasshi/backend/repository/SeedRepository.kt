package jp.hasshi.backend.repository

import jp.hasshi.backend.entity.SeedEntiry
import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

@Repository
interface SeedRepository: CrudRepository<SeedEntiry, Long> {

}