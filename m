Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825060;
	b=R6xZmKtRfLdq4TwvP3AKDSp5j5phYHv98HwLZXU35o+Z1ZVIzpeqzDJ/cmnvAVLlAv1o
	 foa+YaYFM/TDI8AluK9AmzpPkl6BvKPvlXWiKTAmZksA8rrAGwnnMIRDOtWyWECzruC9l
	 p0aIjjkVipQbSt1t9zYOYC6iSW81uTQrKYkJiq+mWyoMCjAnZc9BLRCwzSW9j2haKkpx5
	 mjGaXp0be3tgyb4vAQrS55f+Kag0s1kmNbbYgCTVkGLJEVQS0LvaTAHJy6WJc020RbLTE
	 dM0PN+QN5KLlReVWe7+GxSz9Oq1ZwjiOs0aDoeWrr8nADv/3a0yubbLsL+wzljezl/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825060;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=to98+DcDmiGeCwQfoQ2VZDTmwt8a8ZGapdZ7nqsXj5k=;
	b=tFEvjWJUXsjlJM6dck0vRU5HPUyfv+ARzQQt4yPFa5AY4fjq+aWAIVSIw29e8dV2I2Do
	 nQ2OipjzGswxd/qmuG9y9tdL50XTmn0JoWOIuQjMzvMVKevXllE1yGJutTyLR/MCbLKNs
	 yDu/WF0OWjyFLgqSqP0RF5aEx8fMK3GuR02Nwt8MvOPUJlUhnJYTIXgmalRSOKVUV3rPa
	 LgMSHUu8WcsV1C7Gh4xV/HBgEdlOR3cAZOKxFb2jzqsdFQ8VfWy4Kjhk91Fi6pFkdZDAq
	 1h1u2uLEA9udTf4G3XWnbx9R4p8nSj488LrdrqGckXJeAVMH0ySjS+gQKoIWBZaHdsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOWz5mw4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919E7606A335
	for <asahi@lists.linux.dev>; Mon, 16 Nov 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOWz5mw4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E156E1F000C4;
	Mon, 16 Nov 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825060;
	bh=to98+DcDmiGeCwQfoQ2VZDTmwt8a8ZGapdZ7nqsXj5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hOWz5mw4VsXbd3K3Xa8wjwV4Pyao3mt/T6x92bFB8OjglVqxNGlmZ1JCl7QSs1Oaz
	 /Wj0UBvnnByfibS/2hIZfndy6d4wJRKMqqKDG+BNhIpQ0EYqWVc+20us0sQbpO9our
	 Prk2LhZuFEwK/t5HPQXudOH+tZRDNyAsYJpS48zf7MQO8gWh2o5JkeWA38W2Dwu9bh
	 XX71pBNdUZBywGGZBAirTWTk/Rbc+6D07ov4CW6Lx0vQOCdKCPG4+pzPvambtc3cXV
	 HUgQzmoeiHHqe74xQcvFaVzHRT/U1iOySwYOSNw+OcgkpKvLAzXQTeEfAC4hWFcIKk
	 QlYIRFbPC2/kw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:17 +0100
Subject: [PATCH v2 01/64] drm/adp: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-1-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>, 
 asahi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tAVQBol0Lhf572Tv/c1kcRUOOJZcfgh05A5Vz6JqObk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bjvcXmFsp9d2YW+CeDVT1xNnthd8u1K4up/ZWE49V
 Vf+u/Z7x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIcRdjw/XWVQ2sWus9Li93
 uZV4sM/g3ZzrP2zYrp6VYSl9vCOsaNn9ynlr7328zW4akstfO3M1G2PDm5LNRsm3RKUKazuZe4v
 kLPWLe1t97y/VOFRpt4h1vcEU07t376jJVMpvz4hY4/fBtAMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Janne Grunau <j@jannau.net>
Cc: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev
---
 drivers/gpu/drm/adp/adp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index fdf0e6316175..795e8a5d3b13 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -448,13 +448,11 @@ static int adp_setup_mode_config(struct adp_drv_private *adp)
 	if (ret < 0) {
 		drm_err(drm, "failed to initialize vblank");
 		return ret;
 	}
 
-	drm_mode_config_reset(drm);
-
-	return 0;
+	return drm_mode_config_create_initial_state(drm);
 }
 
 static int adp_parse_of(struct platform_device *pdev, struct adp_drv_private *adp)
 {
 	struct device *dev = &pdev->dev;

-- 
2.56.1

