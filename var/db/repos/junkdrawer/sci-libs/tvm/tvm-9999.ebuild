# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="End to end Tensor IR/DSL stack for deploying deep learning workloads"
HOMEPAGE="https://github.com/dmlc/tvm"
EGIT_REPO_URI="https://github.com/dmlc/tvm"
EGIT_SUBMODULES=( '*' '-dmlc-core' '-HalideIR' )

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="cuda llvm opencl opengl vulkan"

DEPEND="sci-libs/dmlc-core
	dev-libs/halideir
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	llvm? ( sys-devel/llvm:= )
	opencl? ( virtual/opencl )
	opengl? ( media-libs/glfw )
	vulkan? ( media-libs/vulkan-loader dev-util/spirv-tools )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DUSE_CUDA=$(usex cuda ON OFF)
		-DUSE_LLVM=$(usex llvm ON OFF)
		-DUSE_OPENCL=$(usex opencl ON OFF)
		-DUSE_OPENGL=$(usex opengl ON OFF)
		-DUSE_VULKAN=$(usex vulkan ON OFF)
		-DINSTALL_DEV=ON
	)

	cmake-utils_src_configure
}
