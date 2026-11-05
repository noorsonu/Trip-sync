package com.tripsync.trip.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import com.tripsync.common.entity.BaseEntity;
import com.tripsync.user.entity.User;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "trips")
public class Trip extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, length = 150)
    private String title;
    @Column(nullable = false, length = 150)
    private String destination;
    @Column(nullable = false, length = 1000)
    private String description;
    @Column(nullable = false, name = "start_date")
    private LocalDate startDate;
    @Column(nullable = false, name = "end_date")
    private LocalDate endDate;
    @Column(precision = 12, scale = 2)
    private BigDecimal budget;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private TripStatus status = TripStatus.PLANNED;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "owner_id", nullable = false)
    private User owner;

}
