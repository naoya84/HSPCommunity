package jp.hasshi.backend.entity
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jp.hasshi.backend.model.Seed
import jp.hasshi.backend.model.Tag

@Entity(name = "seeds")
data class SeedEntiry(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,
    val username: String,
    val text: String,
    var favorite: Int,
    val comment: Int,
    val tag: Tag,
) {
    fun toModel(): Seed {
        return Seed(
            id = id,
            username = username,
            text = text,
            favorite = favorite,
            comment = comment,
            tag = tag
        )
    }
}