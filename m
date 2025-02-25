Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EA4F5E0
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464135; cv=none; b=Hqwbs/2Rw5c9/6JyqpWPZcoz3Eb14Uyg4MwSL9ONrQIJfya9dHotTKKHU52qd+RR8cA4q4A01z/1EQmXe+SMpbRVW61zuJoUSkaQcY3DVGPaFAjSDpvWB59q7rePR/MVabp4tXel55Vd3hT5sSa9MVuLrpEpF0H+rMqcvinPoGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464135; c=relaxed/simple;
	bh=HgM3X+2m9OLk23re74divjBIz3FHJmXQ7ME23ohXbng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvZzEcS48lHQU3QFazlN7mnHm7fWgrRZxFq+kZAnAwqZJhfhY2Scwr0Ge9TOqKO8RPbXazLzWSimN9CgGXRnWthRtA5ZkL0KFl2zSZxd2qB3eTFhVKGx8ESVbWbzDo2cwwwuSH0Ep9R4GcSsw2YeUrd7uNZ601VR2jbJ6kcdYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auQd+c4u; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auQd+c4u"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22100006bc8so91332275ad.0
        for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 22:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464133; x=1741068933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=auQd+c4uclgLynjzoW8VKZBWVWOfMsvXd/VfCmPw2UmOoYecU1RkZwz/yvaUYdDYNn
         uIzAh+XzTTKZg4eC34Kz1bSwAWInp/DVXIKRl3yDJZzwTMEp8jOPfaK0dfq0re+1ibaC
         8fb6Z+lsaJ9iKbusRkHnb2lLO4MK60s723Ys9NQyeo4oYFTo2luNGg0HDLnWtWn084Sc
         yDzZ7isYkC3Ooafoorz3pVAdavh2EQOAYNOaNiHN3k6I2YSBec3ZqN5U3hAVsov9oY2Z
         805bCCVynvBsI4aNgkntNd+VpWiSBmuTu8nV6tVkItfk0nl3JhwQUGLT9WpgAx+UIwan
         e6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464133; x=1741068933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=ieV40y9NMm5KjJzi15F++vKzV6kIIgKyCPibAAIXGFAC4m/4KF5YMMSsaD2cK8C49Q
         cUvv4wYI222c3kmwyXzsxfp5kh7u6bv1RYLel2UDD+mTtFVLljYZHqwLZ5prct5RE1DA
         rBl+gaecvUGLSWTs2aLI6uV5Td6JtJndKd8PCfUtSJIhjZMKkqpOHgAfAMBzCwW+E5MD
         +JMYsmEZa9ryUIyPzIvPs01p7VgNl0mg+ItDJwS8yo39j2D4ClIU01ea87Tg3UN+xgm+
         3ivaTcnpoSIzQ//kGLev8EM6EIo4IZjmTRHrJAe3DMgUaNBa/tm1FYzAeRQRboPlQLje
         N33A==
X-Forwarded-Encrypted: i=1; AJvYcCW8D6QH56KCP5AToe6lD3Qta2w9a9Gm78s6XuFgtjQBw5V6BnqH2gEN8AdWPgIWkUX1mcwo7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YywIxs38fS3kPqti10d9idyfbbCT2j/nz3tdbAfccU8MxNpccxL
	tqCGHgf8O5H78JNkTvoZoiiLu7RmDaiuh5cZlTtE/LHJ8CbwX3Nx
X-Gm-Gg: ASbGncsL8wzT15hxloqJNyhuLBT3Ltz6ytrDZRcuyGZ9n5TfCNQgjBx3Dak8DmRowSN
	rJgF+5PZQ7X1MFhdFA4SHKk0kncS0TunXoUoYOIUQFtckRXZrx1t4fvUP0MUbHbYWtvV+dJoNem
	l3mE/sYXd4G18QUPYheIOM6SFimQLQhKVHmDacJq89Lg6ZRlDZwTZitC5JYp2FmsjRZUkAeMF9u
	/IHP7EcW4nKmDxrtQxGmo4AE8mOBlTo+u0QQRipCN25cLhCzi+ujn0HtS91/XVuudLzyjB8ndrB
	6GjifezlBpnImF/3rLtHZGOdaZg=
X-Google-Smtp-Source: AGHT+IHDiLECh5yByH1sqMd4J17h9IDxzVERpUbYyDl0rY6eqOShJa0CuOD+3YJm6Gm3L11VgcDmyg==
X-Received: by 2002:a17:902:ec86:b0:220:f151:b668 with SMTP id d9443c01a7336-22307b4c1f5mr33221655ad.20.1740464132903;
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ea22sm687195b3a.138.2025.02.24.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 22:15:29 -0800
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
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z71gAbRi4XRZ-fTb@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:02PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry
