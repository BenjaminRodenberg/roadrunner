# A simple configuration summary for roadrunner.
macro(ConfigurationSummary)
    message(STATUS "
########################################################
# Build Summary for libroadrunner ${ROADRUNNER_VERSION}
########################################################

For up-to-date news and releases visit libroadrunner.org

Configured on host $ENV{COMPUTERNAME} ${HOSTNAME}

Options
-------
    Host OS                             ${CMAKE_SYSTEM_NAME}
    Host architecture                   ${CMAKE_SYSTEM_PROCESSOR}
    With LLVM?                          ${BUILD_LLVM}
    With legacy C? (DEP)                ${BUILD_LEGACY_C}
    Enable Python interface?            ${BUILD_PYTHON}
    Enable Java interface?              ${BUILD_JAVA_INTERFACE}
    Enable test suite?                  ${BUILD_TESTS}

CMake variables and options
---------------------------
    CMAKE_C_COMPILER                   ${CMAKE_C_COMPILER}
    CMAKE_CXX_COMPILER                 ${CMAKE_CXX_COMPILER}
    BUILD_DEFINITIONS                  ${BUILD_DEFINITIONS}
    CMAKE_SYSTEM_VERSION               ${CMAKE_SYSTEM_VERSION}
    ROADRUNNER_VERSION                 ${ROADRUNNER_VERSION}
    CMAKE_CXX_COMPILER_ID              ${CMAKE_CXX_COMPILER_ID}
    CMAKE_CXX_COMPILER_VERSION         ${CMAKE_CXX_COMPILER_VERSION}
    CMAKE_CXX_STANDARD                 ${CMAKE_CXX_STANDARD}
    CMAKE_POSITION_INDEPENDENT_CODE    ${CMAKE_POSITION_INDEPENDENT_CODE}
    CMAKE_INSTALL_RPATH                ${CMAKE_INSTALL_RPATH}
    CMAKE_CXX_FLAGS                    ${CMAKE_CXX_FLAGS}
    CMAKE_C_FLAGS                      ${CMAKE_C_FLAGS}
    CMAKE_CXX_FLAGS_RELEASE            ${CMAKE_CXX_FLAGS_RELEASE}
    CMAKE_C_FLAGS_RELEASE              ${CMAKE_C_FLAGS_RELEASE}
    CMAKE_CXX_FLAGS_DEBUG              ${CMAKE_CXX_FLAGS_DEBUG}
    CMAKE_C_FLAGS_DEBUG                ${CMAKE_C_FLAGS_DEBUG}
    CMAKE_INSTALL_PREFIX               ${CMAKE_INSTALL_PREFIX}
    CMAKE_VERBOSE_MAKEFILE             ${CMAKE_VERBOSE_MAKEFILE}
    CMAKE_BUILD_TYPE                   ${CMAKE_BUILD_TYPE}
    CMAKE_RUNTIME_OUTPUT_DIRECTORY     ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    CMAKE_LIBRARY_OUTPUT_DIRECTORY     ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    CMAKE_ARCHIVE_OUTPUT_DIRECTORY     ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
    MSVC_RUNTIME_LIBRARY               ${MSVC_RUNTIME_LIBRARY}

    WITH_SANITIZER                     ${WITH_SANITIZER}
    BUILD_SHARED_LIBS                  ${BUILD_SHARED_LIBS}
    BUILD_DOCS                         ${BUILD_DOCS}
    BUILD_TESTS                        ${BUILD_TESTS}

Dependencies
------------
    THIRD_PARTY_DIRECTORY               ${THIRD_PARTY_DIRECTORY}
    GOOGLETEST_SOURCE                   ${GOOGLETEST_SOURCE}

    LLVM:
        LLVM_FOUND                      ${LLVM_FOUND}
        LLVM_INCLUDE_DIRS               ${LLVM_INCLUDE_DIRS}
        LLVM_LIBRARY_DIRS               ${LLVM_LIBRARY_DIRS}
        LLVM_LDFLAGS                    ${LLVM_LDFLAGS}
        LLVM_LIBRARIES                  ${LLVM_LIBRARIES}
        LLVM_FLAGS                      ${LLVM_FLAGS}
        LLVM_VERSION_MAJOR              ${LLVM_VERSION_MAJOR}
        LLVM_VERSION_MINOR              ${LLVM_VERSION_MINOR}
        LLVM_VERSION_PATCH              ${LLVM_VERSION_PATCH}

        BUILD_LLVM                      ${BUILD_LLVM}
        DOWNLOAD_LLVM_BINARIES          ${DOWNLOAD_LLVM_BINARIES}
        LLVM_ROOT                       ${LLVM_ROOT}
        LLVM_INSTALL_PREFIX             ${LLVM_INSTALL_PREFIX}

    clapack:
        CLAPACK_SOURCE_DIR              ${CLAPACK_SOURCE_DIR}
        CLAPACK_INSTALL_PREFIX          ${CLAPACK_INSTALL_PREFIX}
        CLAPACK_INCLUDE_DIR             ${CLAPACK_INCLUDE_DIR}
        CLAPACK_STATIC_LIBRARY          ${CLAPACK_STATIC_LIBRARY}
        BLAS_STATIC_LIBRARY             ${BLAS_STATIC_LIBRARY}
        F2C_STATIC_LIBRARY              ${F2C_STATIC_LIBRARY}
        CLAPACK_STATIC_LIBRARIES        ${CLAPACK_STATIC_LIBRARIES}

    libsbml:
        LIBSBML_SOURCE_DIR              ${LIBSBML_SOURCE_DIR}
        LIBSBML_INSTALL_PREFIX          ${LIBSBML_INSTALL_PREFIX}
        LIBSBML_INCLUDE_DIR             ${LIBSBML_INCLUDE_DIR}
        LIBSBML_STATIC_LIBRARY          ${LIBSBML_STATIC_LIBRARY}

    poco:
        POCO_SOURCE_DIR                 ${POCO_SOURCE_DIR}
        POCO_INSTALL_PREFIX             ${POCO_INSTALL_PREFIX}
        POCO_INCLUDE_DIR                ${POCO_INCLUDE_DIR}
        POCO_FOUNDATION_STATIC_LIBRARY  ${POCO_FOUNDATION_STATIC_LIBRARY}
        POCO_NET_STATIC_LIBRARY         ${POCO_NET_STATIC_LIBRARY}
        POCO_UTIL_STATIC_LIBRARY        ${POCO_UTIL_STATIC_LIBRARY}
        POCO_XML_STATIC_LIBRARY         ${POCO_XML_STATIC_LIBRARY}
        POCO_ZIP_STATIC_LIBRARY         ${POCO_ZIP_STATIC_LIBRARY}
        POCO_STATIC_LIBRARIES           ${POCO_STATIC_LIBRARIES}

    sundials:
        SUNDIALS_SOURCE_DIR             ${SUNDIALS_SOURCE_DIR}
        SUNDIALS_INSTALL_PREFIX         ${SUNDIALS_INSTALL_PREFIX}
        SUNDIALS_STATIC_LIBRARY         ${SUNDIALS_STATIC_LIBRARY}
        SUNDIALS_INCLUDE_DIR            ${SUNDIALS_INCLUDE_DIR}
        SUNDIALS_STATIC_LIBRARIES       ${SUNDIALS_STATIC_LIBRARIES}

    nleq1:
        NLEQ1_SOURCE_DIR                ${NLEQ1_SOURCE_DIR}
        NLEQ1_INSTALL_PREFIX            ${NLEQ1_INSTALL_PREFIX}
        NLEQ1_STATIC_LIBRARY            ${NLEQ1_STATIC_LIBRARY}
        NLEQ1_INCLUDE_DIR               ${NLEQ1_INCLUDE_DIR}

    nleq1:
        NLEQ2_SOURCE_DIR                ${NLEQ2_SOURCE_DIR}
        NLEQ2_INSTALL_PREFIX            ${NLEQ2_INSTALL_PREFIX}
        NLEQ2_STATIC_LIBRARY            ${NLEQ2_STATIC_LIBRARY}
        NLEQ2_INCLUDE_DIR               ${NLEQ2_INCLUDE_DIR}

    rr-libstruct:
        RR_LIBSTRUCT_DIR                ${RR_LIBSTRUCT_DIR}
        RR_LIBSTRUCT_INSTALL_PREFIX     ${RR_LIBSTRUCT_INSTALL_PREFIX}
        RR_LIBSTRUCT_STATIC_LIBRARY     ${RR_LIBSTRUCT_STATIC_LIBRARY}
        RR_LIBSTRUCT_INCLUDE_DIR        ${RR_LIBSTRUCT_INCLUDE_DIR}

End Summary
########################################################################################
")
endmacro()
