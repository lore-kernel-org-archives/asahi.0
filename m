Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C4438015
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791120780; cv=none; b=DN31AVlv9WLAqfYICa+ddzEYvlaSFrWqNHswlSUhqUYMX3qoD0ylcrAnN8wu8fU2wI6fCp8MX07xdBpuHsEJe3CHQe6Hap+jf8repjmz9TzLQkcSjcFCPh1KRWIZkJRg8Y46AamlFgDYzADKJn65ASXpil3WAbBJMdGTCDVets4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791120780; c=relaxed/simple;
	bh=1+k00O3LND89cQEhluXVGIxTtZ/cWD8RGcLFGETy+k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7kuxxDtIhsLTCOZ2v2WtyZBscnSWPng/yvYDppQuFsSBRBs0y7PvhOZG7chGNlq/h5Qq2uwLCmj4dEIeivyC+yhj+DQzyQ6cIxsoKj74gnb5UxMi3p00zuVNlgyoIjjBMDrW714XyyIdv0GAi2YXu8ouAGveL3tsW56MNZHRdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=TtnbeKi9; arc=none smtp.client-ip=95.215.58.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="TtnbeKi9"
X-Envelope-To: asahi@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1+k00O3LND89cQEhluXVGIxTtZ/cWD8RGcLFGETy+k0=;
 c=simple/simple; d=rosenzweig.io;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791120772; v=1; x=1791725572;
 b=TtnbeKi9HBePGYhcPY4zYZ9ZYkGrsIvWoRlWdpfZzbB7lA7dUlEy6jNQ5VUW2eKVuKQxXDJc
 W+ZAY/Lu7bJADPQJmXNwBWagg4pgMS2qddgTK6/1m7GV+5AS4aY/eMcTatOXbECwHosekPmfz5j
 esy0lSwumngxhiQsMMgIVFaAJdB/ui5N7WubQZ5c7qHwXYadVJLzlAFLOqZFLvicvUFxCy4lbT8
 x10gUA+NKir2wDioiuSLpkdyzI2AIyo2Ii2jB33l3BymsJP12bVsVc9mnfEVom0tOJtyvE1dJ5v
 dY8NoC7SBolpM53g65mGwO952ttlXlwxcye/EYGnWOI3A==
X-Envelope-To: asahi@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 293fd97adc88c8a6;
	Sun, 04 Oct 2026 13:32:52 +0000
X-Mizu-Trace-ID: 293fd97adc88c8a6
X-Migadu-Flow: FLOW_OUT
Date: Sun, 4 Oct 2026 09:32:48 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Oliver Bestmann <oliver.bestmann@googlemail.com>,
	sofus <sofus.c@icloud.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2] drm/fourcc: Add Apple Interchange layout format
 modifier
Message-ID: <asJVgFVWYzG0frrM@fedora>
References: <20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261004-apple-interchange-modifier-v2-1-410a3d0541f6@gmail.com>

The one big missing piece here is how strides are defined. I assume from
context it's the same convention as GPU_TILED_COMPRESSED but this should
probably be spelled out.

Just adding a sentence "Strides follow the same convention
as DRM_FORMAT_MOD_APPLE_GPU_TILED." should be enough to define the uAPI
unambiguously here. With that it will be

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenz.ca>

Le Sun, Oct 04, 2026 at 10:42:29PM +1000, James Calligeros a écrit :
> Apple Interchange is a tiled and compressed image layout used
> for buffer exchange between Apple hardware blocks. It is
> similar to the already-supported GPU_TILED_COMPRESSED layout.
> 
> Add a format modifier for Apple Interchange so that it can be
> used for buffer exchange.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> Changes in v2:
> - Fix typo
> - Link to v1: https://patch.msgid.link/20260831-apple-interchange-modifier-v1-1-5d6e27f9f308@gmail.com
> 
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index a103fdc0b3a3..d304ee5c614c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1626,6 +1626,26 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
>  #define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
>  
> +/*
> + * Apple Interchange layout
> + *
> + * Apple Interchange is a compressed framebuffer format used exclusively for
> + * sharing buffers between hardware blocks (GPU, display controller, video
> + * codecs) on Apple platforms. It is similar to and uses the same compression
> + * scheme as GPU_TILED_COMPRESSED. There is no known uncompressed variant
> + * of Apple Interchange.
> + *
> + * Unlike the GPU layouts, tile size is not dependent on bit depth. RGB
> + * images and the chroma components of YUV images use 16x16 tiles. The
> + * luma component of YUV images uses 32x32 tiles. Compression tiles
> + * are once again 16x16 with 8 bytes of metadata per compression subtile.
> + *
> + * AGX has limited support for Apple Interchange. It cannot be used for Z/S
> + * buffers or array images, for example. It is intended for scanout buffer
> + * sharing only.
> + */
> +#define DRM_FORMAT_MOD_APPLE_INTERCHANGE fourcc_mod_code(APPLE, 3)
> +
>  /*
>   * AMD modifiers
>   *
> 
> ---
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> change-id: 20260830-apple-interchange-modifier-cbcc311c835d
> 
> Best regards,
> --  
> James Calligeros <jcalligeros99@gmail.com>
> 
