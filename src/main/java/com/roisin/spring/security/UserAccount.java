/* UserAccount.java
 *
 * Copyright (C) 2014 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 * 
 */

package com.roisin.spring.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

import com.roisin.spring.model.DomainEntity;

@Entity
@Access(AccessType.PROPERTY)
public class UserAccount extends DomainEntity implements UserDetails {

	/**
	 * Serial uid
	 */
	private static final long serialVersionUID = 7254823034213841482L;

	// Attributes -------------------------------------------------------------

	// UserDetails interface --------------------------------------------------

	/**
	 * User account username
	 */
	private String username;

	/**
	 * User account password
	 */
	private String password;

	/**
	 * User account authorities
	 */
	private Collection<Authority> authorities;

	/**
	 * User account enabled field
	 */
	private boolean enabled;

	/**
	 * User account locked field
	 */
	private boolean locked;

	/**
	 * User account activation date
	 */
	private Date activation;

	// Constructors -----------------------------------------------------------

	public UserAccount() {
		super();

		this.authorities = new ArrayList<Authority>();
	}

	@Size(min = 5, max = 32)
	@Column(unique = true)
	@Override
	public String getUsername() {
		return username;
	}

	public void setUsername(final String username) {
		this.username = username;
	}

	@Size(min = 5, max = 32)
	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	@NotEmpty
	@Valid
	@ElementCollection
	@Override
	public Collection<Authority> getAuthorities() {
		// WARNING: Should return an unmodifiable copy, but it's not possible
		// with hibernate!
		return authorities;
	}

	public void setAuthorities(final Collection<Authority> authorities) {
		this.authorities = authorities;
	}

	public boolean getLocked() {
		return locked;
	}

	public void setLocked(final Boolean locked) {
		this.locked = locked;
	}

	public void addAuthority(final Authority authority) {
		Assert.notNull(authority);
		Assert.isTrue(!authorities.contains(authority));

		authorities.add(authority);
	}

	public void removeAuthority(final Authority authority) {
		Assert.notNull(authority);
		Assert.isTrue(authorities.contains(authority));

		authorities.remove(authority);
	}

	@Transient
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Transient
	@Override
	public boolean isAccountNonLocked() {
		return !getLocked();
	}

	@Transient
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Transient
	@Override
	public boolean isEnabled() {
		return getEnabled();
	}

	@NotNull
	public Date getActivation() {
		return activation;
	}

	public void setActivation(final Date activation) {
		this.activation = activation;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(final boolean enabled) {
		this.enabled = enabled;
	}

}
