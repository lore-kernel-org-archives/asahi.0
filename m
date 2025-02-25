Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D72566F1
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 06:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464092; cv=none; b=un/KtZl+5MPahVbEfm12qy5s0rXZzQj729eNeyNkOy9dZqeP13LRI8wok0ZTxrXKKm7vH7l34maLhEm1uiEj906gGCk8+pb1xNeTCR6YJe05pa16CykEEDnW+8jekZiUgPGDWQMjiPvcQwbLXUgBbk1zjj1W3s2ULD6Zuzt4494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464092; c=relaxed/simple;
	bh=agvOuJoTNh8OTM20uhL6EZgzAA082YyQcg0WmGwlpK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA4357bafG3uYV/YjpWQ5xm6aw7Yzk/NcWiTAjui645qTeOt0/BkvtEbl34LYBizeQ7hcOsII1fYQOI5hJ5JNsflOYJNEkhib33+oR7M7ViAHUZqQVLCnmYoGfLIEDelU9/4xDoB75AI/7f7i5pxSzdEGioLkkH3QxZ8kpPLLMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBDKCK5G; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBDKCK5G"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c4159f87so73230355ad.0
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464091; x=1741068891; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=JBDKCK5GSAtYDpuREbP3ds0ZYmBAbcHyvIn2Nzm8b6jj1zBcwTxA4fuS3zTjYnQFC5
         AwRAbIuC86cgmBAgo2CBEaqSdRzbHgF2987gw3+NHuh2k7WBStaL7yvyRu7buKz7Gd4E
         +pQDQOORWJd0fxSUkJUrzHHIgS6WJyvpeP2XxaogmR8+Xs16iXE7oJqSH/kzkuobB+Iw
         pxkpvpmjws4xxV9rok/xfO6ZBCM+J5qgXDVjbEINjDz9P0D/bPOuR83UbaXg2e2SXe+S
         U+F++/FqZsbsSzgX3eeAjH+OXRVXt1wIZDy4sISZJavzkiZ9FakCDU+hI87fhZmrd7KL
         vYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464091; x=1741068891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=VGDuYQq835B2RA9WhbiB4p6zpCBbDWeVPr/fk0TgaInNfPEMKL3dZCLu4qiBAsA3PF
         6b6eW84NQOqPPAP8lHxFMsJtLa6P+1qv6XLogQ/VWq+7LC69bIeoGXgxX+MlUUyc608o
         cKpVFeKAVf7QZe0+WoPINKXXDn1t8JTHT/CoFgaIqcVnUktvOsYaX39Js1zqjkJxBy5O
         7Fkj3QUSL76AapCI5aGMrOzFG24Ev7T6QAMqB88EJCXZJG1ZNMDFaUE6s/Vl3X1CoqX9
         qM/GpjWw2y3dKK2s30ved5Ls/OU/KtVGhOHobOyFLGXll7FACIbpc93QrOAKPnj0dMHu
         CwRA==
X-Forwarded-Encrypted: i=1; AJvYcCXncXpqPxMs9z1pqr9ECX+/zAl/joBC+JKj5q+FZG28+dvlHtFcKvaNjdavQvSwtOuv4GgvsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZb+HsSWLbFM5y6HxmcpzBdo9gXoTAqySclhjVONGw3d7PkX1v
	2sclQXwbmjxKDkFUsQ27U5mcYx94A5g6XYLkO8FQ9nBkJH+XIm6b
X-Gm-Gg: ASbGncs/Rn14CvLRPYb0SDXu9GvBWXLHIz9UJ8MIUvYTW5b/ePIQW+sEFQarvpEIaLN
	jG2N91mlxfGt8nkxt0N91O9hbc+HTOq4fADUSlDdMr/n2xCBKNUiBkL2/FBdE5MYmOMb3GcZr0X
	RHTWXHVVTC8SmFIeKfMamXI5lc9CDDP07pDdOLgin0LBhQ+pALTpby7pF8yuQvkzq2iI4ZnSMlw
	VCUp90D9JjWMf5g3QkAyzCN984zpLtxR5OKnpUfj9LnPCqmggxOg8gxFuEy3CXa9ZmQOLb6d2Dh
	UZTf9F9qtkk3iKdDe/gizIv0uhA=
X-Google-Smtp-Source: AGHT+IGwkid3k/avMSIUbwqT5je0rV66CDm1UlnOW0Q6bT9hXylAJGMLD+sehIyy1nTfXR9ACddpGQ==
X-Received: by 2002:a17:903:22c2:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22307b45598mr38223475ad.5.1740464090521;
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0927a7sm6292795ad.143.2025.02.24.22.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Date: Mon, 24 Feb 2025 22:14:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v7 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z71f18TQLEiexUaD@google.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>

Hi Sasha,

On Mon, Feb 24, 2025 at 12:01:08PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v7:
> - Added a dependency on ARCH_APPLE to prevent potential confusion on x86
> - Link to v6: https://lore.kernel.org/r/20250205-z2-v6-0-cc60cbee1d5b@gmail.com

My apologies, I already applied v6 (patches 1, 2 and 4). Could you
please resend against linux-next (or my 'next' branch)?

Patch #3 should go through Sven's tree.

Thanks.

-- 
Dmitry
