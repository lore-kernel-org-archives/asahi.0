Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E1256C73
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 06:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464166; cv=none; b=OXPkS7+T5ldzlkvGR758J6wH2P65r7znGZMApglVrBBHWZLHtE9Z+CTsi8meFWptlW3tzvJbVaupndQfGaHlW/iiyhnT0IjkOuUtet0jeodKCJQZHKJM+zpyVPv/ZX1Xnz8cPXmSCw+0JBFZXUmvXTynH3nmTiikMd5bl2/sRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464166; c=relaxed/simple;
	bh=y04/eiKfX+VDFzL/EZx/SP/AByliZxx8ctE2if+rkdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUsDr80FBjbmRyo2GbnMHAE3CLTb8I75N80PhWzg7LIuVA/O0GcV/IIA/7LpBLZYl2+UI0MhOPiMmuYhPBBsa8zIy4xtZWIpRf3ZGr5Hmu1wKdf6deAZCt4Twp2No9mH/lLAEKXVNXgviX6rEX5eMKOZDpayaVTrzeic84klTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=az0BRKMp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az0BRKMp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220c2a87378so87586075ad.1
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 22:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464164; x=1741068964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=az0BRKMprL6JvosKFHn1IYEAWjENYElBmPnyyXy1e8CQ5LbcpTdWtOUaSTp7KlKx7w
         +daik2kT68UnzqwKZJIhU8jSPcfn5JDf5Eh+ML1+2Y3TpuWi4mADLfy1PaWFzMDYKwZa
         wr5gBwb7hBkIUTnUsXrKg2Qts7Xk1d8OQ61iYr7dqKOrD+U87wkpCS4DuhIq14/tC1V1
         oADdltCrTmoYvYPyknQn22FADxhmWvbPQW6+r+4qDXSXqNqdT/nPGLSKZz2b9zPtw8/s
         g+U5Kq3JVyvfg3C39MLY/rjb1QQmGn1LhN9kBkxxc6LIFvSOzpE/2JiV1urnjOtzrKaY
         JtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464164; x=1741068964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGVgTKfQzcM6BCbf3nLCuH4nvK6a2ubqTOhh2w4FSvk=;
        b=bNjjQeyVx6eE7an7nKNzhIBfTsU3JtLmwIWTjqFD9TtRUi5PN2Mg9FW6GbHKVw/CME
         9p0HzjvFMn68o9xRahl2AV0il0a6RpxOo9molmnShVLkyYKfZW+VH+a04t6mFDH8UkvT
         AKuiq0UYQQHSHf+pAW3aGbRsjLkJrRQlv5uUpvVVnlfJk8ImMpJCflahW7sbLZSURhdO
         YdtMLt6oYoYqFMhPamAJu6nMyl5UYTHgJtSAYGMp8xjfMnRj0wj2m5gTK5FSSaJt0Ixh
         wsds5lH09QrEhJy3ueg1+kScGn/aS8cSDgITBSW5sfhjF00kiLQZowlt/kBkT3d92vnK
         270w==
X-Forwarded-Encrypted: i=1; AJvYcCXa/0B8oy0V908ViD8FaTFybIr9Tv+N+z20jQTOLjqHzS+pbRWGcqM7s3/k0ZgHyQNzCsruqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrJp0/gjrgLr5cJVnNtIVzg4BHWrjmSfQJU8dNkPmGfJxf7nwS
	LiJ3Z8rhfUTKrL4OsMaLf3F7vmEesXulzzIyr1ZUhg99wq8fpE/m
X-Gm-Gg: ASbGncsELSWAek6gQPcyA0gVIshGU0ok9ZRB5EAZpjRGc42GO+MZaDxjnBKd3jj2GUp
	jhW3g1p/vF0nKK0dePkxX5xW/ZyrbT5FZetABlwhFplWhX7PDWXa6+jNQV0tVRPBX70b6UWP/cv
	MkmrcYUxFcPH/v6po3978XyK0drWwA7327Z/UB7JO4WbQYdTwE71hNXfte8Yqj6m0QGNDWTzJqC
	ksWwWNXO+RxiXhrNoA8r7vbys4vZdhuHdCjecSid1ll8+I8xQ51FtGVlxy5/Y2//dALxgI5w3oR
	XywHeGZ8gPoDBCaIKrhUjh5mxZY=
X-Google-Smtp-Source: AGHT+IGs+VKr+OOlZlfm7dkEfjYmOfYQgfwqv6Qp2AFuCJdvwfEPwuo5Oa3/2GGy2JMQF7Y0gUE6/w==
X-Received: by 2002:a17:903:1ce:b0:221:7b4a:4773 with SMTP id d9443c01a7336-221a11c2577mr235316805ad.51.1740464164054;
        Mon, 24 Feb 2025 22:16:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a613bsm6264785ad.192.2025.02.24.22.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:16:03 -0800 (PST)
Date: Mon, 24 Feb 2025 22:16:00 -0800
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
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 4/4] MAINTAINERS: Add entries for Apple Z2
 touchscreen driver
Message-ID: <Z71gIEbbnA3gCQ0O@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:04PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry
