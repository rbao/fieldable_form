FieldableForm
==============
FieldableForm is intended to make building an end user facing form builder easier. It provides all the base models necessary for building such functionality and also some erb and js templates for bootstraping the views.

Installation
-------------
FieldableForm is only compatiable with Rails 3+.

    gem 'fieldable_form'

Getting Started
----------
The best way get started with FieldableForm is by looking into the [Sample App](# "Sample App").

### Form Model
The core functionality of FieldableForm is provided by the base form model `FieldableForm::BaseForm`. It is recommanded that you do not use this model directly, instead you should build your own form model by inheriting from this class.
    
    class ProductForm < FieldableForm::BaseForm
    end

The form model is basically a container that holds all the fields of a form. You can deal with the individual fields by simply calling `#fields` which is just a `has_many` association defined in `FieldableForm::BaseForm`.

### Entry Model
The entry model is the model that will hold the values of the fields that user entered through the form. This model is not provided by FieldableForm and you should build it by yourself. However, it needs to have an attribute which can holds the field name and value pairs as an hash.

    class Product < ActiveRecord::Base
      attr_accessible :product_form_id, :properties
      belongs_to :product_form
      
      # provides validations for the form field
      include FieldableForm::Validations
      validate_fieldable_form :product_form, :properties
      
      serialize :properties, Hash
    end

Then in the views you can use `OpenStruct` to render the fields from the `product_form` and its corresponding values.
    
    <%= f.fields_for :properties, OpenStruct.new(@product.properties) do |ff| %>
      <% @product.product_form.fields.each do |field| %>
        <%= render  "product_forms/entry/field", f: ff, field: field %>
      <% end %>
    <% end %>

Bootstrap Views
----------------
The FieldableForm gem itself only contains models and does not provide any views by default, since views will be much different for different applications. However you could get a default views and some useful helpers as a starting point.

    rails g fieldable_form:boostrap


