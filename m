Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9E2570
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 08:50:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 31A103FB17;
	Fri, 24 Feb 2023 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677228637;
	bh=M10zbadndwKZhD79Kr8HJcwiw4rH1LF/7cTiGWMgTk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=rxZyMibjaZ6LZEVtlYDJAKnfIA8G8nCJ6WBhvtUFKt+oa44YUYkNytz/nRl7PIjK3
	 KsovDYXQ7NxK4j0FoX30fybbD/sTebMJBDIoqR9KSzLGyc8Lp+IO16y+OFsXKltDzy
	 BobDpVsTTYVYOONz883rwyRgu1dv5Xlv+EEDpbCbfJtiTGRoTrf4l7KtudA93X4BTk
	 Uf6hMIV46bR6OCV8WYI7OtjxwKTdWlAUUdfdYBzvRUfpssj719iFfVcqpQcdCasLRe
	 Uq7EB3xIgb9z2DGg/xJgsHcQFIt/bd7Vkm/5htImkA6ybhaCY1hxgEvrC086rTLWo2
	 Q6uig72WcEk6g==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 17:50:19 +0900
Subject: [PATCH 1/5] rust: error: Add Error::to_ptr()
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-rust-error-v1-1-f8f9a9a87303@asahilina.net>
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
In-Reply-To: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: Fox Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677228630; l=1624;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=M10zbadndwKZhD79Kr8HJcwiw4rH1LF/7cTiGWMgTk8=;
 b=z9aZrN4fCmRuP/ostz6C6/F/Fyl5yn8Ylw5KNL2xDbGwWpW4TGwxSiMXo66tBPTFXeAM/J8XP
 hFMbaVVmizHA2/pLsbqC/BVXiYzZ79/viIlk3yIwIoQl2id9f+fFNdr
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

This is the Rust equivalent to ERR_PTR(), for use in C callbacks.
Marked as #[allow(dead_code)] for now, since it does not have any
consumers yet.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/helpers.c       | 7 +++++++
 rust/kernel/error.rs | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/rust/helpers.c b/rust/helpers.c
index 09a4d93f9d62..89f4cd1e0df3 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -20,6 +20,7 @@
 
 #include <linux/bug.h>
 #include <linux/build_bug.h>
+#include <linux/err.h>
 #include <linux/refcount.h>
 
 __noreturn void rust_helper_BUG(void)
@@ -46,6 +47,12 @@ bool rust_helper_refcount_dec_and_test(refcount_t *r)
 }
 EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
 
+__force void *rust_helper_ERR_PTR(long err)
+{
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 5b9751d7ff1d..8611758e27f4 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -76,6 +76,13 @@ impl Error {
     pub fn to_kernel_errno(self) -> core::ffi::c_int {
         self.0
     }
+
+    /// Returns the error encoded as a pointer.
+    #[allow(dead_code)]
+    pub(crate) fn to_ptr<T>(self) -> *mut T {
+        // SAFETY: Valid as long as self.0 is a valid error
+        unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
+    }
 }
 
 impl From<AllocError> for Error {

-- 
2.35.1

