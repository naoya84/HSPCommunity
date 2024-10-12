package jp.hasshi.backend.controller.response
import jp.hasshi.backend.model.Tag

data class GetSeedResponse(
    val id: Long,
    val username: String,
    val text: String,
    val favorite: Int,
    val comment: Int,
    val tag: Tag,
)