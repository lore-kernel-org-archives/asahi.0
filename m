Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDC7F9
	for <asahi@lists.linux.dev>; Fri,  7 Mar 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339868; cv=none; b=h8uFDWj3vTJfK8EK5i7ipjoUbrclku1yZwMdwchwJHM2eo/GPZlnO8j1GNAPsS3hJ5anrKvnRmTM4/XgGQZLZRkwI2UQ+6PMjzt+btI1AXndedqCAEpN7WlqJHvqd4Lp2FWYuFie0fgi4R90DyLhVVxaO1ei/KRcRggdAIZVs5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339868; c=relaxed/simple;
	bh=0clyfl35KjfOEHzeeZP6agmpTPeexmG9vqN3A0Y5WQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBtVY6lzSSfgnoCCzLMeY+8P+tcuhKAfnqngTGeCOeqhWXJ2XY+8GO6oAKRI7loiTMWkf8Qeph+w1k2ujN0qtH0l0o1VCRI5etnVqw0s4mJbMkqELtGCtqRN5ANqQUBIfHxwUn51mD4AtR6MmqH+RzfFHyEIperNDftSBCFtIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnnaX94O; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnnaX94O"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391211ea598so1064816f8f.1
        for <asahi@lists.linux.dev>; Fri, 07 Mar 2025 01:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339864; x=1741944664; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
        b=tnnaX94O8fZAzTS62XfosWcAQ6lOiKG28musDBZgCJint+yQUzQhG1X4luPKjHls5t
         DXNkKgOcPjYEf4dROiH/QEB29xQHTlVFErg3Xg6pmVzrYaxWhysGmVN6nw/BvsrYDT4N
         YX/vMP+6kN9pvx0hw1aiizgA5SMDMt0dsnONFJtlcNvAMCouRPXtrj84RCwaSy4fnD4g
         zY1oS4WsXy2gIJXo9Wr+7hgHi7CdI7A7qYpUBOenZWO35L4hSuu6Nd1yC407DxJDXoDB
         BG5TFi2b+BZ2+EeSMmwFcxFTvrODwsyBSak8yn6uusEroUmCRvRPcBJPP4fMowFt00Er
         LOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339864; x=1741944664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
        b=jd06upDAOd5J3aYbUfwVC3bCgdCY0DFb8XzIxmnUpTFcqnyRk/D8d6wNYnk7Ywr/3s
         dAnMHAUx6On9/b7/Hp89sAHnzWbsTxN385eG9nC4yIaFRJzAiE6Ez6N6lEfiEzTiJbK2
         CfZSzAh94jpgZ/jf4u8YqLM16ZI4r4eZ9GkrSfycw2i8+gGp9H37RZZf9d3/6d3XdDl6
         GhPjR2Zecz8bT5SkSqynUeUxXQxpx6q22SqEQa30c1pcH6FeravjqWq6phPVX/CGjLd8
         g3szjA74P0ihuDZS3KE6slId6PYK+bLgLhFQMVSLMY7FTrDmwj+3lNwlI/pctp3WRR/K
         LKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+NMx1dbcmBzIwpiN0ON1NML2/nuQspx+uD96D7m84qVxuWlt7cQ9adh57lvrfC8CY2NewUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGrcDfMI0pz/ZqzKihrmelXrIr+56Em0LCT7MczN7yWjaj9iPF
	7rIuiiloAXEm6D8/uYm5v4tv8QSFzZzIdi9GU0P/BLTWBXkePwlugapj/V1s/FU=
X-Gm-Gg: ASbGncu+0HBjkHR8jzReLXp0snsDZZaHeH7zD78wAXjng5mdd3lpl7Pf2qW7BoMqVT2
	QNzfE+GsbaXBQd6vU4h/l9MXTp+IVx7pnCU5RavSDuIxYdL/3kx8KevNRcHSIIpfARy9Lpoxg6u
	4E/znaXP+bwoD5FEZ7xUUDkK+usihYM+C4cyc1eLSzEkyNUeHtYLlukYNjW+5BULyh4r41vM/7d
	zHkjbyjWM7yduEtAkbdC5+Apg+p5XANm/d+XVUYaljkWeqjOhFHh5zRFzCZEntt72lqvYl70c9r
	YJnCcSnPWhBDayWCz+bDfIedGLc/D0OJAAuij2vfkV5VRIonvg==
X-Google-Smtp-Source: AGHT+IHGgil9XvvJ/78/5L3MyKGSYheLPT+najegLrndXP1vKPLf/Ab1cHu+/RbdCgsBcMvfznnH8w==
X-Received: by 2002:a05:6000:402b:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39132db746amr1441891f8f.49.1741339864000;
        Fri, 07 Mar 2025 01:31:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2f39sm4690339f8f.80.2025.03.07.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:31:03 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
Message-ID: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __drmm_universal_plane_alloc() function doesn't return NULL, it
returns error pointers.  Update the check to match.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 0a39abdc9238..db36807005a6 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -232,9 +232,9 @@ static struct drm_plane *adp_plane_new(struct adp_drv_private *adp)
 					     ALL_CRTCS, &adp_plane_funcs,
 					     plane_formats, ARRAY_SIZE(plane_formats),
 					     NULL, DRM_PLANE_TYPE_PRIMARY, "plane");
-	if (!plane) {
+	if (IS_ERR(plane)) {
 		drm_err(drm, "failed to allocate plane");
-		return ERR_PTR(-ENOMEM);
+		return plane;
 	}
 
 	drm_plane_helper_add(plane, &adp_plane_helper_funcs);
-- 
2.47.2

