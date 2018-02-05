{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand index-page">
    {% for post in page.posts %}
      <article class="post post-type-normal">
        <div class="post-block">
          <div class="bg-img" style="background-image:url({{ post.thumbnail }})">
            <a href="{{ url_for(post.path) }}">{{post.title}}</a>
          </div>
          <p class="content">
            {{ strip_html(post.content).substring(0,theme.title_length) }}...
            &nbsp;&nbsp;&nbsp;
            <span>
              <a href="{{ post.path }}" target="_self">{{ __('post.read_more') }}</a>
            </span>
          </p>
          <div class="bot">
            <div class="bot-left">
              <div class="author-avatar" style="background-image:url({{ theme.avatar }})">
              </div>
              <div>
                <strong>{{ config.author }}</strong> 
                <span>{{ time(post.date, 'YYYY-MM-DD') }}</span>
              </div>
            </div>
            <div class="bot-right">
              <span class="post_entry-tags">
                {% for tag in post.tags %}
                  -
                  <a class="post_category-link" href="{{ tag.path }}">
                  {{ tag.name }}
                  </a>
                {% endfor %}
                <i class="menu-item-icon fa fa-fw fa-tags"></i>
              </span>
              <span class="post_entry-category">
                {% for cate in post.categories %}
                -
                  <a class="post_category-link" href="{{ cate.path }}">
                  {{ cate.name }}
                  </a>
                {% endfor %}
                <i class="menu-item-icon fa fa-fw fa-th"></i>
              </span>
            </div>
          </div>
        </div>
      </article>
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
