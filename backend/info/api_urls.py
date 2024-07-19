from django.urls import path
from .api_views import StudentDetailAPI, TeacherDetailAPI, StudentAttendanceAPI, StudentMarksAPI, LoginView, LogoutView

urlpatterns = [
    path('api/student/<str:USN>/', StudentDetailAPI.as_view(), name='student_detail_api'),
    path('api/teacher/<int:id>/', TeacherDetailAPI.as_view(), name='teacher_detail_api'),
    path('api/student/<str:USN>/attendance/', StudentAttendanceAPI.as_view(), name='student_attendance_api'),
    path('api/student/<str:USN>/marks/', StudentMarksAPI.as_view(), name='student_marks_api'),
    path('api/login/', LoginView.as_view(), name='api-login'),
    path('api/logout/', LogoutView.as_view(), name='api-logout'),
]
