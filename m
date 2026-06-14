Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24602EC0A4
	for <asahi@lists.linux.dev>; Sun, 14 Jun 2026 20:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470624; cv=none; b=P0GbHuEJvWUDfxzNNIWBtxwOJXId/kytSJf45nLz2O9EjAXlYyGpKyst7xbsqdZ4eBAH+YfkYpqtAdzUTy94aWPim5BSO6DQDqOFdqdz59upmUNPg0S6fa65BHEZxCvw4y9WBu5fuEdrDKnCKf+0hUOYt5HASW/Jz6AB2A/AD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470624; c=relaxed/simple;
	bh=+bi8XwCzuwIhibsEF8K9s8nePKLZJJ3bOGbQ9AVgJ6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANcILgGP5sTLerSNl/2qk73RLjdv/3JQZyQPZOC9YsYaEhcWEiE+0AjHas/91fItlZWq4IdOyVI+I8oknx2P9BF2u79j02j1H0u9A4/NAoimrtT2hw9tlW2O6Fa4sYiDYtiF5/KAjOWmKLZnYzJAWBDIpKdpBXacui0NfYJCqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2LY6Ic7; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2LY6Ic7"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3075ce9c05aso6634395eec.1
        for <asahi@lists.linux.dev>; Sun, 14 Jun 2026 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781470623; x=1782075423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5fQgJl/JNDh0rlg6/DBaSueHDvPwrSzOEw4D/yzM6I=;
        b=k2LY6Ic7N3eqpUuy/JHKvYV717hvq70LudYbuZaCjcWgULZDxo45FBsz+e/TV/tnA9
         tCFPXA/9I3t0iZs6SKP6ZGWYQSNNEIk2W7NloabeytvTyEdI9tKmjqcECSvmbE7RGUFl
         ScWghBgCYQHXOeAy/8lqJa8syzs+h6/q12eItk4bRpA1XPRexvmj6JYqgvUpHhHcgAwR
         3FV8oJxk6aNYHlNwwd3PWkT37SpW7SqKFsAidufPShjWQb5XeSAANtkeyM/Y0lWtICtl
         c9Yef2vsQpFxqxykT98IKVba4WK+JCZ5oGiCkgTF+gfrg2azeafzvQUzf/y5CcbwGxOh
         2PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470623; x=1782075423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5fQgJl/JNDh0rlg6/DBaSueHDvPwrSzOEw4D/yzM6I=;
        b=PC2vwDc4Bo4aFeTkDjR957YCjPzMZydNov6bJnOuZbe3tUCOOM0EbL6gaqfQxiWSg9
         ebgqHUszeikTDj4WDqNg67ToNLaDWN3z2xHASn0vK3ID/B9ptaKalK0YNWVT+2DR/Dp1
         ROj5n+ZRlTaN9qgzpkt2HrkqBNZr0p0hlE/b016CsssVMffx10mego6kkwoQw7F/B0MH
         dNyplwKYOLOy3u04+3qSZSgoiVXqNdHZ8w37P9ZgDG9CAvaKMo0ZiUV7+hXQ2d9sb/AQ
         5rvVEX6XSf2ylrOn0dZdy5Vs/4pSvudag+8P2R1h5gg4GcHeaFK9G1rA12jnzjO6tjPc
         MfKw==
X-Forwarded-Encrypted: i=1; AFNElJ/ItTAjV/Sfl9qSwm3HdGBfn6xR1EzVBBqa2s/v8czOg/aXf6gorzmS0AL+LoLj7MJhQkEP3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3Fo5qW4ctCcqeO7sXTYp5qRSrJYicEitVjUzqgb+jIJvzmk+d
	pX0HJPM6hHe5+H2ID5adyO44yFgDLyE/Gy/835FPZnG9YQEIeC/PJmR5
X-Gm-Gg: Acq92OEEGqeEJM2ilBO6WuEoJ5YqyHUpTLs2rYtJr9upar3NbM4eLdl2GNgx2aogdbL
	A9+O06qfYpHDlKYlpt/yNTUSYKRgm9P4XQYUOQqLYrvxBzd9oXzLV1RqdLDgQCR9CygYEXSZQMK
	sSQ/rND9Fj4xfwDuifishx2B/Fns0DUuEFDI2+zFqEX+uPdCehEl1iYH6mvYyez1aeAr5e6DgYh
	OtVVsYQzly111QUzgPWDnID/jeuWhsD5RdYkyT/djq02x/0oAYEzevqXlIoaZ0/c2N/rliVmDop
	8WM83C8ehouvTotcvIz2P7zQpi59FdOhd6KkB9ZMG1NS/BqF1nZqK9+UI3d2KIUF+w/ag+uNj/k
	kfLWvVMwunm/wqLiOxftGLQYfKNjF733mQ4v/DRnfIj3AoO9Qi/XIGh5xGs1nOrJfwxErTDFTaW
	/oH8i9drYmnMoKdwRtd4iH0JWjc6rMY5MHxnscvMNPmurfN0oHl+8vDbr9wmOyaKJ4
X-Received: by 2002:a05:7300:7fa2:b0:304:6448:dfea with SMTP id 5a478bee46e88-308200de778mr7033067eec.33.1781470622807;
        Sun, 14 Jun 2026 13:57:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5d91:5c26:602d:6a99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489536sm12233295eec.2.2026.06.14.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 13:57:02 -0700 (PDT)
Date: Sun, 14 Jun 2026 13:56:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: hexlabsecurity@proton.me
Cc: Sasha Finkelstein <k@chaosmail.tech>, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, Sven Peter <sven@kernel.org>, asahi@lists.linux.dev, 
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2] Input: apple_z2 - bound the device-reported finger
 count
Message-ID: <ai8U0QiwpBH8qNS3@google.com>
References: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>

Hi Bryam,

On Sat, Jun 13, 2026 at 08:22:51PM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> apple_z2_parse_touches() takes the finger count from the touch
> controller's report and loops over that many fixed-size finger records
> without ever checking the count against the length of the report:
> 
> 	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> 	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
> 	for (i = 0; i < nfingers; i++)
> 		/* read fingers[i] ... */
> 
> msg points into the fixed 4000-byte z2->rx_buf and nfingers is a single
> device-supplied byte, so it can be as large as 255.  A malicious,
> malfunctioning or counterfeit controller (or an interposer on the SPI
> bus) can report a large finger count in a short packet, making the loop
> read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
> into msg -- far past the 4000-byte buffer.  This is a controller-driven
> heap out-of-bounds read, and the finger fields that are read (position,
> pressure, touch and tool dimensions) are forwarded to userspace as input
> events, leaking adjacent kernel memory.
> 
> Bound the device-reported count to the number of finger records the
> report actually carries.

As Sashiko mentioned, if we do not trust hardware to send valid data we
should also validate that packet size supplied by the device is
reasonable.

Also I wonder why would we want to report some of fingers in case when
device sends bogus number of contacts? I'd drop such packet (maybe
logging ratelimited or "once" message).

You can ignore Sahiko's comment about __free(kfree) not handling error
pointers.

Thanks.

-- 
Dmitry
