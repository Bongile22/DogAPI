package DogAPI.Features;

import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertTrue;

class DogTestRunner {

    @Karate.Test
    Karate testImages() {
        return Karate.run("postImages.feature").relativeTo(getClass());
    }

}
