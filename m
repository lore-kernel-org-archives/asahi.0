Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981885;
	b=eOAWnY+tPBdcilUpgQxiIGzoqcZxavU9mD7qVbAhlLVlbgqhmG9vL7RwzSYbCAudOpqW
	 UrFNxDLjx1rx53d1saZidU155rdBwD1haAjdb895bqxSHxktduc8zmP1i4o3AJP4ZH00a
	 H6oRrjW2KJSe5SqVmQlq42k9xLM3fmx6Yoxw0d/PSDFieVClJlBjEHHS3l3SCAmbW8dVB
	 avKQGEo9hqvcB7WMsjwpziQp4Xu/ho+aOctXJR3mohJvdgBkHGkJw2XRYdpHj3rFKCtUE
	 kTBXNhqnZlHcnBaVGmY0+jiM1fVMXU6tzjk0nhRcDSykC8Xr1SIit8Y8BIPTn5DjM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981885;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=3x7iGTfwP0zFRfuTC8P49hF9dS2iRlaB+/rk9f7a8BM=;
	b=gLyLVz1hK7SeClbEeS8JVgU9L2YC/Ae4DtINzgm+bHtFhL3/sTMRrobQ4Xbq9Jy9jzYz
	 Fksr3IgfSX8gMxVdKlS2M2zeya34FO0GXj8fBFC+a+SfEDux324snkjGSNYnLXY+01QgI
	 cG35lYFuOYGFM14o7zGyHMsewWe6zN6fNCRojp3QXOMSVPUemPqZXAr6B8Sa9nDIo/m5y
	 Gb99OeDcQc43hmlX02UX7cHn5JWF6gtMZUWuiYT3HdrCgloLBvCrBBTkedicdlzP9sWFr
	 J1bTXTe7gJ1c9XutrhKMsfLXeDla2eLdcl0Ry3ypJdabZqerbXW//SbE83WGgbC+bOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXdKDX5R;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498B606D81E
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3498B606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXdKDX5R
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 570AAC69169;
	Fri,  6 Nov 2026 16:18:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE5305FFBC;
	Fri,  6 Nov 2026 16:18:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF6D110329280;
	Fri,  6 Nov 2026 17:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793981877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3x7iGTfwP0zFRfuTC8P49hF9dS2iRlaB+/rk9f7a8BM=;
	b=lXdKDX5RICq5PX1ODUm/S7WmpspQRDhmOuEPTczGRZAr4Apd3iPVRY1EGMsRJ25rcEVBW3
	XbDQbWKdiIrc9mStMpw/kqKFoCV61REuAbOnrgP+In6tqxEhdK702TMO0zHd+MlDy+2B9X
	GrgzDR1beLKQGnqR5UmtPdf8mBnTG633PcLhxojFfvZBDXKelXI7PVmdHzilfG7J+4lrua
	CpQ9pX1CN/7ZxOwZqbKWp0tU8Q5K50Mg4hqmG42d+70ittupJYY4is35jBGqW8IoDg2yX+
	5arFEPSI9fgt8WPoNmfnuGieU7PUOronMHzqoei7alqLOMP8FPsnmXo3g/gz1A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Nov 2026 17:17:06 +0100
Subject: [PATCH 3/3] drm/todo: remove drmm_of_get_bridge()
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
Message-Id: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-3-c0ea3382b798@bootlin.com>
References: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
In-Reply-To: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This function has been removed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/gpu/todo.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..de4de6f7a0b4 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -477,7 +477,6 @@ transparently, and the are deprecated.
 The funcions to remove are:
  - drm_panel_bridge_add_typed()
  - devm_drm_of_get_bridge()
- - drmm_of_get_bridge()
  - drm_panel_bridge_remove()
  - drmm_drm_panel_bridge_release()
  - devm_drm_panel_bridge_release()

-- 
2.56.0

