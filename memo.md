<h2>Sign up</h2>

<%= form_with model: @customer, url: customer_registration_path, local: true do |f| %>
<%= render "devise/shared/error_messages", resource: resource %>

  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name, autofocus: true %>
      <% if @customer.errors.include?(:name) %>
        <p style="color: red;"><%= @customer.errors.full_messages_for(:name).first %></p>
      <% end %>
  </div>

  <div class="field">
    <%= f.label :email %><br />
    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
      <% if @customer.errors.include?(:email) %>
        <p style="color: red;"><%= @customer.errors.full_messages_for(:email).first %></p>
      <% end %>
  </div>

  <div class="field">
    <%= f.label :password %>
    <% if @minimum_password_length %>
    <em>(<%= @minimum_password_length %> characters minimum)</em>
    <% end %><br />
    <%= f.password_field :password, autocomplete: "new-password" %>
      <% if @customer.errors.include?(:password) %>
        <p style="color: red;"><%= @customer.errors.full_messages_for(:password).first %></p>
      <% end %>
  </div>

  <div class="field">
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation, autocomplete: "new-password" %>
      <% if @customer.errors.include?(:password) %>
        <p style="color: red;"><%= @customer.errors.full_messages_for(:password).first %></p>
      <% end %>
  </div>

  <div class="actions">
    <%= f.submit "Sign up" %>
  </div>
<% end %>

<%= form_for(:customer, :url => session_path(:customer)) do |f| %>
  <%= f.text_field :email %>
  <%= f.password_field :password %>
  <%= f.check_box :remember_me %>
  <%= f.label :remember_me %>
  <%= f.submit 'Sign in' %>
  <%= link_to "Forgot your password?", new_password_path(:customer) %>
<% end %>

<%= render "devise/shared/links" %>
