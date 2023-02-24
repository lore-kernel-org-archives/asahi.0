Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B47C
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 08:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7EC654206F;
	Fri, 24 Feb 2023 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677226201;
	bh=Vvt7C/Qtdf+lSrPhP4SxMEJD9NARvhOFIMSePHVXMBM=;
	h=From:Date:Subject:To:Cc;
	b=jtmrute9igtKAUq7bOnesWb49I1rfuWEjjkwRxjJKybIblRkkQZTa4baPo4/fvE4x
	 nOr7lLn7vcdN+NebByNfjf4n4jv41zIztIBZ2CuHQlIdg9oGyGCG1o7G6LfWVykDtw
	 Hhs+/R3cdHhabErr0K0T8k3Kajv16ZRCv/+LIHPfCfvCvF4sP1VPUEUO9gwFXFDJCV
	 bs0iq7zEPafqj6Fwhv/L07JXKzhym+OutxZo8RsGJ9LQQrDm4dUCbVOqqpPWwR0GG6
	 IZcFTA8BKfZurnVLmd3BRC1nEkqMUvPSgDQOCOLhXYGRRpzM1nw3hJqH+RFb76Oiuh
	 yWT8XXSvUq8Zg==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 17:09:47 +0900
Subject: [PATCH] rust: Enable the new_uninit feature for kernel and driver
 crates
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-new_uninit-v1-1-c951443d9e26@asahilina.net>
X-B4-Tracking: v=1; b=H4sIAMpw+GMC/x2N0Q6CMAxFf4X02UbcIKi/QowZo0JfKmmZmhD+3
 Y3Hc25O7gZGymRwrzZQ+rDxWzJcThXEOchEyGNmcLXztXMNarIVhb7PJCy8Ymi7dvTN7dpFD7k
 aghEOGiTOpZuWdD6S4su+KL34dzz2j33/A1OafPuBAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nicolas Schier <nicolas@fjasle.eu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, asahi@lists.linux.dev, 
 Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677226197; l=1846;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=Vvt7C/Qtdf+lSrPhP4SxMEJD9NARvhOFIMSePHVXMBM=;
 b=iGrkIuoxuSMO1QXhhx+sDziNY0zHKFDHhoq50D0J0m6VllqYs8TOIfVBtQZng2W9DYJJ975i8
 9KKIMpiGKLNAFu65pXllS/2i9f14R8c7WE4G+ZIbAAuZsBgTFFr2esW
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

The unstable new_uninit feature enables various library APIs to create
uninitialized containers, such as `Box::assume_init()`. This is
necessary to build abstractions that directly initialize memory at the
target location, instead of doing copies through the stack.

Will be used by the DRM scheduler abstraction in the kernel crate, and
by field-wise initialization (e.g. using `place!()` or a future
replacement macro which may itself live in `kernel`) in driver crates.

See [1] [2] [3] for background information.

[1] https://github.com/Rust-for-Linux/linux/issues/879
[2] https://github.com/Rust-for-Linux/linux/issues/2
[3] https://github.com/rust-lang/rust/issues/63291

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/lib.rs     | 1 +
 scripts/Makefile.build | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 223564f9f0cc..1118cd3e0b5f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -17,6 +17,7 @@
 #![feature(core_ffi_c)]
 #![feature(dispatch_from_dyn)]
 #![feature(generic_associated_types)]
+#![feature(new_uninit)]
 #![feature(receiver_trait)]
 #![feature(unsize)]
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a0d5c6cca76d..0f637e1ca8dc 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := core_ffi_c
+rust_allowed_features := core_ffi_c,new_uninit
 
 rust_common_cmd = \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \

---
base-commit: 83f978b63fa7ad474ca22d7e2772c5988101c9bd
change-id: 20230224-rust-new_uninit-a575d34987c3

Thank you,
~~ Lina

