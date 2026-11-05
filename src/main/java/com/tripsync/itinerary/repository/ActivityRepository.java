package com.tripsync.itinerary.repository;

import com.tripsync.itinerary.entity.Activity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActivityRepository extends JpaRepository<Activity, Long> {

    List<Activity> findByItineraryIdOrderByDisplayOrderAsc(Long itineraryId);
    List<Activity> findByItineraryTripOrderByDisplayOrderAsc(Long tripId);
    boolean existsByItineraryId(Long itineraryId);

}
