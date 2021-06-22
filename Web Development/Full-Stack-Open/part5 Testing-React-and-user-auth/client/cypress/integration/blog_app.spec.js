// blog_app.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test


describe('Blog app', function() {
  beforeEach(function() {
    cy.request('GET', 'http://localhost:3003/api/blogs')
    // create here a user to backend
    cy.visit('http://localhost:3000')
  })

  it('Login form is shown', function() {
    cy.contains('log in').click()
  })

  describe('Login',function() {
    it('succeeds with correct credentials', function() {
	cy.contains('log in').click()
        cy.get('#username').type('My usernamewer')
        cy.get('#password').type('change me')
    
        cy.get('#login-button').click()
    })

    it('fails with wrong credentials', function() {
	cy.contains('log out').click()
	cy.contains('log in').click()
	cy.get('#username').type('My usern')
    	cy.get('#password').type('change me')
	cy.get('#login-button').click()
	cy.contains('cancel')
    })

    describe('When logged in', function() {
      beforeEach(function() {
        cy.contains('log in').click()
	cy.get('#username').type('My usernamewer')
        cy.get('#password').type('change me')
    
        cy.get('#login-button').click()
      })
  
      it('A blog can be created', function() {
        cy.get('#title').type('This Title')
        cy.get('#author').type('This author')
	cy.get('#url').type('This url')
    
        cy.get('#save').click()
      })
  })
  })
})
