package Breed_VotesAPI.Features;

import com.intuit.karate.junit5.Karate;

public class BreedNotesRunner {

    @Karate.Test
    Karate testImages() {
        return Karate.run("getAllBreeds.feature").relativeTo(getClass());
    }
}
