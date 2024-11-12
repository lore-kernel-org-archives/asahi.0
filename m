Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739920B218
	for <asahi@lists.linux.dev>; Tue, 12 Nov 2024 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731441347; cv=none; b=LOO08nN/PYSgHiIpO6V9nJLFGYkbxAzemWrMknqKuL8nbYmGP3v54jvmWSwToMTW8AnyH6+OGdnSwlR5+0dWneWNYgWr0O9YoXkFIrzd8Mznm7yQ7eq3weRnaxx0H5Ge2w/BBeGRwUpzzpQJ/hyx3lmw6IICJqQBedmCHbCiGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731441347; c=relaxed/simple;
	bh=c94xZUz5BVRzxe1+uUbcC3auFTeo4NkaFnXe7tuvETA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H+/5PPbKl+a21xI7DQ4oJa+RVU7U61NshAjb2npP8Vh2AeV1yXh4CzYBFMrMWlPsU1VdBlN6hqPml6/45Xoo3+qNZcp9wkl9I59/EiI0NDSNYGdKHSvw0Wf1T91RM0ZX7TdGeJTPyIeVV1muFJ724wj96q2QfVZkQo0JGB2jKKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=CvjabDkU; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="CvjabDkU"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 03D693FA6A;
	Tue, 12 Nov 2024 19:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1731441334;
	bh=c94xZUz5BVRzxe1+uUbcC3auFTeo4NkaFnXe7tuvETA=;
	h=From:Date:Subject:To:Cc;
	b=CvjabDkUJUSSXOJExrmb9n9jBWbldd3zbnbE9fOlnTjyQwUZCmqg0TUWhnljH/jH5
	 CcPFuMlQTtrFxrcpE6B/sP5SsTJXWIaKQWLYknOW3VBEXE+ES6/Z6nugx+eK8q15J7
	 K0LiHQZFuXYs635KqwUosvSHPxw/lcwFZrWLln45qW+hxK232vdZOFUcrp/QQrYxhQ
	 VJeqgt36Ge5gSb6vYokcL9Q9bPcNj9mYvjhhx82H8NldKKR/X8Gj21XI7sGBBtSJ8o
	 hmhEr4yzK73oc6tpjRpFH1XuPjKwyZxNG0r+Vsbr29YmWbLZbqKzIXFugT1CRrt1rb
	 cYRj70mJJn26A==
From: Asahi Lina <lina@asahilina.net>
Date: Wed, 13 Nov 2024 04:55:32 +0900
Subject: [PATCH] fuse: dax: No-op writepages callback
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-dax-no-writeback-v1-1-ee2c3a8d9f84@asahilina.net>
X-B4-Tracking: v=1; b=H4sIALOyM2cC/x3MQQqAIBBA0avErBtoUqS6SrRQm2oILDQqiO6et
 HyL/x9IHIUTdMUDkU9JsoUMKgvwiw0zo4zZUFe1JiKFo70xbHhFOdhZv6ImNs4p0zbOQ872yJP
 c/7If3vcDv70xw2IAAAA=
X-Change-ID: 20241113-dax-no-writeback-41e6bb3698bc
To: Miklos Szeredi <miklos@szeredi.hu>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Sergio Lopez Pascual <slp@redhat.com>, 
 asahi@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731441333; l=2006;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=c94xZUz5BVRzxe1+uUbcC3auFTeo4NkaFnXe7tuvETA=;
 b=RITMZ3OffyOGQq+meVQPdwN87olVlNUBbNxkxDcqPQQ/ROTA+RYl1EH63EH5poTnKOMEOUEBi
 mvNOmc+uGmjD2yAbLq0Or+s4ebqCvcJ14c21zu/Ww52zWMgLazBtDyC
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

When using FUSE DAX with virtiofs, cache coherency is managed by the
host. Disk persistence is handled via fsync() and friends, which are
passed directly via the FUSE layer to the host. Therefore, there's no
need to do dax_writeback_mapping_range(). All that ends up doing is a
cache flush operation, which is not caught by KVM and doesn't do much,
since the host and guest are already cache-coherent.

Since dax_writeback_mapping_range() checks that the inode block size is
equal to PAGE_SIZE, this fixes a spurious WARN when virtiofs is used
with a mismatched guest PAGE_SIZE and virtiofs backing FS block size
(this happens, for example, when it's a tmpfs and the host and guest
have a different PAGE_SIZE). FUSE DAX does not require any particular FS
block size, since it always performs DAX mappings in aligned 2MiB
blocks.

See discussion in [1].

[1] https://lore.kernel.org/lkml/20241101-dax-page-size-v1-1-eedbd0c6b08f@asahilina.net/T/#u

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 fs/fuse/dax.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 12ef91d170bb3091ac35a33d2b9dc38330b00948..15cf7bb20b5ebf15451190dac2fcc2e841148e6c 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -777,11 +777,8 @@ ssize_t fuse_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
 static int fuse_dax_writepages(struct address_space *mapping,
 			       struct writeback_control *wbc)
 {
-
-	struct inode *inode = mapping->host;
-	struct fuse_conn *fc = get_fuse_conn(inode);
-
-	return dax_writeback_mapping_range(mapping, fc->dax->dev, wbc);
+	/* nothing to flush, fuse cache coherency is managed by the host */
+	return 0;
 }
 
 static vm_fault_t __fuse_dax_fault(struct vm_fault *vmf, unsigned int order,

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241113-dax-no-writeback-41e6bb3698bc

Cheers,
~~ Lina

