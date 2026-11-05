Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887689;
	b=cbAs1zfP5OGxDTroG18Pbjf3y2loxWFFGJILChVR2OWeBPk/kT5vVuyEn1nsjEfgMlkx
	 CaFHudA34jURcvkHgUMMzs35t2upATuZ/QmtBLec38IdlGeBe5jZIpDKJQo4PZprkD4nB
	 orn0MNFC2e+Ux8zGavJgGLf6PpecuTASXLf7pDg+AKfEy3D/s0+ulC+cpVAkcYKYJTL4R
	 5Fg+7cGxt3QwNQxKy3L5WVNcm8C/rPpbDN6kqb7Uj7KytnJdVeaYvxMjAk/oFgWYYuNP3
	 76Sbd1exUFkhNJGbH6XdPlYm6zqpqJCimSKq3T9Enmim/RRhHe7FE3up0E+nzOfalSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887689;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wYlrDbfZKbiUUduhrjo8be3m9UAQA5iV14plflcbeiw=;
	b=rap9iplt/QZI7V4yL6lcGaefenlylsqzskssdzeaK82K3K+kxfXq5gkCEkq9wa2+oSH0
	 ZpvdIbBl5H5zq+ksDbtULOQARBnZVh8BbXyaKkSYEP9YXIBWUwCkbOGHIQ87TNvePfmae
	 cgsoav/mauqckeuR8C9JQU1c0m3Z/AA3GoVFE/+lyE+YMQC9zc2ejPUluFuCtNwH7bNDZ
	 QwU8AzET7AcJstZ0TxpFOvHbNAMWanuJk2v//8NcM9szAAN3NnJ0cUV1/YhGFhQZdVoPx
	 bWS/4FskyedvyMYKyedGSISpbezvLr2rOBVa2o+xCuUu2dwnuv4I7ivZyCxb4NbNGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fskWyDIz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67FA606D810
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fskWyDIz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70661F00A02;
	Thu,  5 Nov 2026 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887688;
	bh=wYlrDbfZKbiUUduhrjo8be3m9UAQA5iV14plflcbeiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fskWyDIzs6Mxv8Q1kC65O7wpH8FDiZThEsCbUi/Jbnz8eJmqTb2rw0wpFuztZHK+I
	 yEb6QIGqqAnxPT93vSIGh/rGm6VRwCtZoKgGlStcI2TfgWzCPj0VwSmsErjmFzEOjb
	 3O5vT7ZMvtWBom6Sy9E3PPKcqU9EkRkY2yfJ8dwj8E8hw4p+v6hNhjpbgLSeavvXCR
	 t/fDc9Xfn+F+QjpEa4GWMEB8KLzqfeqJSON5ZyLz7PZbVgTvxQD4f378EiV8bBopgH
	 lccggDGwzlKaUHS2k3oZVICBQnsqIqNLtO31c+vSyPC0zXWe9G5Jn6zVLIN1E1T9kc
	 6l3D8mqV/TlCQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:18 +0100
Subject: [PATCH 01/83] drm/adp: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-1-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>, 
 asahi@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=mripard@kernel.org;
 h=from:subject:message-id; bh=59FroMEoM8DobxGK+qYZEmLe1JeVhpd3TzvlRh+kQ9s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlveuds2zt91r+VJcX9K6bOVlqbfajv+Il+G7OrEQfOu
 OzVEXK27pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT6XzNWB/cFy8q3b5547xE
 l538pZwNfSJahWf8Yjr4U04mxW1l9Liwebf978f/XSperbCZnfrwMGN97vtSA4cL6pd7juV7PnD
 mZuRNrm+913ny3afmTuMk1dVG9Z02c84t36rKbPvjt/Mi5T8A
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
@@ -451,7 +451,5 @@ static int adp_setup_mode_config(struct adp_drv_private *adp)
 	}
 
-	drm_mode_config_reset(drm);
-
-	return 0;
+	return drm_mode_config_create_initial_state(drm);
 }
 

-- 
2.55.0

