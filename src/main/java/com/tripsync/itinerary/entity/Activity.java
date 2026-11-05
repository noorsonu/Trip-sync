package com.tripsync.itinerary.entity;

import com.tripsync.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "activities")
public class Activity extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "itinerary_id", nullable = false)
    private Itinerary itinerary;

    @Column(length = 150, nullable = false)
    private String title;

    @Column(length = 1000)
    private String description;

    @Column(length = 250)
    private String location;

    @Column(length = 350)
    private String notes;

    @Column(name = "start_time")
    private LocalTime startTime;

    @Column(name = "end_time")
    private LocalTime endTime;

    @Column(precision = 12, scale = 2)
    private BigDecimal estimatedCost;

    @Column(name = "display_order", nullable = false)
    private Integer displayOrder = 0;
}
