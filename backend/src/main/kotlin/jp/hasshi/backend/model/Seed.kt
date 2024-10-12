package jp.hasshi.backend.model

import jp.hasshi.backend.entity.SeedEntiry

data class Seed(
    val id: Long = 0L,
    val username: String,
    val text: String,
    val favorite: Int,
    val comment: Int,
    val tag: Tag,
) {
    fun toEntity(): SeedEntiry{
        return SeedEntiry(
            username = username,
            text = text,
            favorite = favorite,
            comment = comment,
            tag = tag,
        )
    }
}

enum class Tag {
    help,
    tweet
}