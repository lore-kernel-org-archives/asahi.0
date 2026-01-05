Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F9288C13
	for <asahi@lists.linux.dev>; Mon,  5 Jan 2026 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767647066; cv=none; b=X50D9AbLnCA851k40rMMmoI6mxPopNliptpC7wpJHEzhIKSB52eqUqhcaCL+BT4ug5mWcWRIgFPNr9FH6uTdbVjZCSHYabIozYaxDLUUEnpy8QlfasovO/+ItaVe2o6On2HEgMFlmriMVXqeo+d/ux2KpyuHJnp5KZEIEJGwBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767647066; c=relaxed/simple;
	bh=ZwcaLXn+30hp2i7GK0AHYvShh54D82Wui2mS0r79TyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfJ696cz1SQqRkrBmUBrCDY6rxHbZrmkfsyz1unWD+aOSZP2vG/3Zaa2ZJiHCrZztxWWfbdK7dwzWw2iD41xNeQpULcCIvRys+7wmH1JCQVTOcy3yuGxyU+qhpFsjTcK7yfZ0nJdmkBpHb1xK/jbYV62qRBbiY/Ij41JMgwzO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=RTlpSjEK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=edPu9so8; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="RTlpSjEK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="edPu9so8"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id BEB7A1D000FD;
	Mon,  5 Jan 2026 16:04:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 05 Jan 2026 16:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767647063;
	 x=1767733463; bh=o9fmI88RcgiSXw/oErFLhD0ik2ZI1klntpYAFbh57pQ=; b=
	RTlpSjEKKXCiJ9wb3rNDhy/xeYrdQfJ3Diy5bz9lXR3nDSBT60GuYMyKFg+7JXLA
	bVYxAHTpJzVg1w4EaCFEewELEXdZQ0F0Ok+PP/5LjmApT8oxMz5mv/Om/qogJzj0
	VoSvN5Yti8NcRqzuusZMCW17ga7ps96FCGvcZqZL4WiOcyH0IGoMMz4U8VTxT1i4
	ACQqb4WppuGuXLyvoroqeFF5IycxE6Xg5bs4P7ffHKHdJjCikvc1DcjTu+8Agr4H
	8KYiWOC7v89U8ReFmE8U5TBNlrYHi9Y/CzO2f65sSEHLJX+jQTPjUDiUB9F1VPH6
	7nZjV/xHrzyezOgZjH2Ssg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767647063; x=
	1767733463; bh=o9fmI88RcgiSXw/oErFLhD0ik2ZI1klntpYAFbh57pQ=; b=e
	dPu9so896eb7Qi1U+iAToh1BUaaKLV1Swf+z2EsxUMyF5up3mWF0ysoDMCI7GKeo
	G7AZpIvfcXRp2BSwYvV1FlIKNkGxAUVS9B2heQjX0stlg8iAU2clXmnb4jY8aJxv
	Dh+6EFlBWMXbbSOXALUrr3CZIfDAMYv7BAngfO0kvTmo6siDxH5Q3+Vl5Y1v22HN
	4Bq47t2+WhlrNlJx8czI6DjNB113kXL7z1qx7ONeAFUUVRP8jPDvXcKH1qm5JXjR
	BVal5c9iiAvHt+694JzGBDRZhxlRKYGMAI4Ea2nuuai9UV6HJFgQNLzqPyZoKbJl
	v97LbzSkdzp60bia0Cw6g==
X-ME-Sender: <xms:VydcaQcPC-6h-lH9eGj8opZnY97NY_HlOKkVUI9cnQV6rhA4MsSuwg>
    <xme:Vydcadr9P4UiP-Oviq8wDQdh60wykoruTaX973FlD_3xhI27mm4B95ZuT14WDydLn
    _681DMHjMGrPNZ46yBlsXH4yhlAMdJkzrOoGgOYBMDLSxI1QYgu1h8>
X-ME-Received: <xmr:VydcaVAFNNMMpMiaOhja4GwJhH_3jFVPDrA0nYNjX-KS6Xw1hlvQZQAlrYi3dZF9QYy7tEm0sYAtzoyOe1mkOt4E6wV-E0s7AP32zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefhe
    ehieeludffheetiefhvddtleffuddtleduudeiudetvdefffehkeehgfettdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqd
    guvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohep
    ihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtth
    hopehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:VydcaaYJ2QoS4VQCEaUEnsV5Ov1mQO-RV71IX6RN6D-7UIqCkKKf9A>
    <xmx:VydcaY7SLhnpWPV_HDC1laBKyxeX1SeI6Pf2OKZhufF2DHNIEpimsg>
    <xmx:VydcabZkpI6Vr8kYcdRrb6BXHR2-i7Lv-PxGWlet3ZoDHKBQOv1BRg>
    <xmx:VydcaXgiWE8IdBViLkS1e0Re9RD9yx6kDBo7d60oqcgck2yH6HBc9w>
    <xmx:VydcaeB1i-NXxZ9YHEOb1-sK-2E63uGQqDr9qX7ebh0ljZejIbfUNetO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 16:04:22 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Mon, 05 Jan 2026 22:03:47 +0100
Subject: [PATCH i-g-t 3/3] tests/asahi: Add test for
 DRM_IOCTL_ASAHI_GET_TIME
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-asahi-tests-wave1-v1-3-a6c72617e680@jannau.net>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3840; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ZwcaLXn+30hp2i7GK0AHYvShh54D82Wui2mS0r79TyI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswYdQfTPwJXZ5yd+G+b2aFFXW1Fl/YYpb9VnlC55pbaH
 2Pet+fmdJSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiIijsjw5stJW85bp1VCXHT
 ejrZemuwgMkkN2U/G1N3hjtM9jN9GBj+h18VO2UqKnz4/Wr3Db33Eq6bf1aRu/yzq3+t+4+tC5f
 qsQIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Test that the call succeeds, to subsequent calls do not produce the same
timestamps and invalid flag values are rejected.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 lib/igt_asahi.c              | 14 ++++++++++
 lib/igt_asahi.h              |  3 +++
 tests/asahi/asahi_get_time.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
 tests/asahi/meson.build      |  1 +
 4 files changed, 81 insertions(+)

diff --git a/lib/igt_asahi.c b/lib/igt_asahi.c
index 90d2c190f0dd05e372af0eefaed22d2b2a26eb71..17ac60749a3a5b03722403386f8b16cc0caeff3c 100644
--- a/lib/igt_asahi.c
+++ b/lib/igt_asahi.c
@@ -42,3 +42,17 @@ void igt_asahi_get_params(int fd, uint32_t param_group, void *params, size_t siz
 	else
 		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params);
 }
+
+/**
+ * igt_asahi_get_time:
+ * @fd: device file descriptor
+ * @get_time: pointer to drm_asahi_get_time struct
+ * @err: expected error code, 0 for success
+ */
+void igt_asahi_get_time(int fd, struct drm_asahi_get_time *get_time, int err)
+{
+	if (err)
+		do_ioctl_err(fd, DRM_IOCTL_ASAHI_GET_TIME, get_time, err);
+	else
+		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_TIME, get_time);
+}
diff --git a/lib/igt_asahi.h b/lib/igt_asahi.h
index f0ac3fbf428a8050957eab0e9b259f68b5ecd0cd..a15acc5a08092fae0b3a569c527087082e6fc05c 100644
--- a/lib/igt_asahi.h
+++ b/lib/igt_asahi.h
@@ -7,6 +7,9 @@
 #include <stddef.h>
 #include <stdint.h>
 
+#include "asahi_drm.h"
+
 void igt_asahi_get_params(int fd, uint32_t param_group, void *data, size_t size, int err);
+void igt_asahi_get_time(int fd, struct drm_asahi_get_time *get_time, int err);
 
 #endif /* ASAHI_IOCTL_H */
diff --git a/tests/asahi/asahi_get_time.c b/tests/asahi/asahi_get_time.c
new file mode 100644
index 0000000000000000000000000000000000000000..91c865d0f8c65b410771b491758a81b4d4a96044
--- /dev/null
+++ b/tests/asahi/asahi_get_time.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) Asahi Linux contributors
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_asahi.h"
+#include "asahi_drm.h"
+#include <stdint.h>
+
+int igt_main()
+{
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver_render(DRIVER_ASAHI);
+	}
+
+	igt_describe("Query GPU device time.");
+	igt_subtest("get-time") {
+		struct drm_asahi_get_time time = {};
+
+		igt_asahi_get_time(fd, &time, 0);
+		// Nothing to assert on, the timestamp could have any value
+	}
+
+	igt_describe("Query GPU device time twice and compare timestamps.");
+	igt_subtest("get-time-compare") {
+		struct drm_asahi_get_time time1 = {};
+		struct drm_asahi_get_time time2 = {};
+
+		igt_asahi_get_time(fd, &time1, 0);
+
+		// sleep for 100 micro seconds to ensure
+		usleep(100);
+
+		igt_asahi_get_time(fd, &time2, 0);
+
+		// assert that the timestamps are different
+		igt_assert(time1.gpu_timestamp != time2.gpu_timestamp);
+	}
+
+	igt_describe("Query GPU device time with invalid flags values.");
+	igt_subtest_group() {
+		struct drm_asahi_get_time time = {};
+
+		igt_subtest("get-time-flags-1") {
+			time.flags = 1;
+			igt_asahi_get_time(fd, &time, EINVAL);
+		}
+		igt_subtest("get-time-flags-2") {
+			time.flags = 2;
+			igt_asahi_get_time(fd, &time, EINVAL);
+		}
+		igt_subtest("get-time-flags-uint64-max") {
+			time.flags = UINT64_MAX;
+			igt_asahi_get_time(fd, &time, EINVAL);
+		}
+	}
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/asahi/meson.build b/tests/asahi/meson.build
index 909e146295e83f558ef7378f814ded55adaafe2b..2997017924f72443a7b5ad907c52a9976f464810 100644
--- a/tests/asahi/meson.build
+++ b/tests/asahi/meson.build
@@ -1,5 +1,6 @@
 asahi_progs = [
 	'asahi_get_params',
+	'asahi_get_time',
 ]
 
 foreach prog : asahi_progs

-- 
2.52.0

