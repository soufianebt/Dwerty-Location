package com.dwirty.gestion;

import com.dwirty.beans.ImageLogement;
import com.dwirty.beans.Logement;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;

class OffrePresentationTest {
    @Test
    void selectsPhotoUsingTheListingId() {
        Logement logement = new Logement();
        logement.setId_log_logement(42);
        ImageLogement unrelated = new ImageLogement();
        unrelated.setId_log_logement(7);
        ImageLogement expected = new ImageLogement();
        expected.setId_log_logement(42);
        expected.setUrl_img_Image("img/listing.jpg");

        assertSame(expected, OffrePresentation.imageFor(List.of(unrelated, expected), logement));
    }

    @Test
    void usesThePlaceholderWhenNoPhotoExists() {
        Logement logement = new Logement();
        logement.setId_log_logement(42);

        assertEquals("img/maison.jpg", OffrePresentation.imageFor(List.of(), logement).getUrl_img_Image());
    }

    @Test
    void doesNotUseAnotherListingsPhoto() {
        Logement logement = new Logement();
        logement.setId_log_logement(42);
        ImageLogement unrelated = new ImageLogement();
        unrelated.setId_log_logement(7);
        unrelated.setUrl_img_Image("img/unrelated.jpg");

        assertEquals("img/maison.jpg", OffrePresentation.imageFor(List.of(unrelated), logement).getUrl_img_Image());
    }
}