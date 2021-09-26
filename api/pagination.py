from rest_framework.pagination import PageNumberPagination


class PageSizeAndNumberPagination(PageNumberPagination):
    page_size = 50
    max_page_size = 10000
    page_size_query_param = 'size'
