Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888EA1F4734
	for <asahi@lists.linux.dev>; Sat, 15 Mar 2025 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031712; cv=none; b=GCSo4FK+qeBiwsOjLYoMwmaB+8mjBS7EtKP55QrAFcTJG+pMa4hLq1mR4dPnN8NlyUgmQVOcj/nMCDTgTFD6p0pchffig5RWAY0RwRTxSB4Wn4pAteOQdNOBvfagFgDH03N54Zvr5hlzFOw+Z7b9xlLyN6MV/Z3TL9vyc+bZBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031712; c=relaxed/simple;
	bh=6F4ZEjbDcZiLLIYSt3jmgj2GxNFjQ0Yxwp2I4wxrw9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjYkB4t+GhYBZWfjQuN22AgpbTEB24crsDALz6PINph3W3N3ByXXkVdddiQgkqNqOKXVYZyUuQhK6UQS3G6FXXwu5gVlZilWZN1XdtSpnal003p9e2ZAKsS5g8VvTuCEAgeLzFEJx/Zc1rPkvbBWv/zCkZjO588HUsgdd2bJ0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNV+Dgje; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNV+Dgje"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f403edb4eso1571180f8f.3
        for <asahi@lists.linux.dev>; Sat, 15 Mar 2025 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742031709; x=1742636509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzNAXBvMCkEVkeIQmxTZZJktEMMoSHZ3SJ4jiX/ukqc=;
        b=sNV+DgjeWJeuMerwmA5RJ4gcixs6gzYY5A0UkKXAcVnDwyEJV5rmFDzBR9n99/SzWJ
         t0/WOYEp1eDhwsgeWfyNsMgVBH7zZTiqfXEhO5aKBIOL2/qbLYS/hD1BXKY83jkeXp+f
         nEdoqWFsQ5hq3OJYgIAegZypptH1Pcmi0netlqWscMX7/6kVGoN0a39Y73Vw5Nz8mw2j
         fphE1lTiyV7tZ0JdlwcMpnCwDwbOIByScE8NxwM2xZxkfHEdSV8Sg6/khuvRMJfoARKL
         ov3jm78dSlZs4X0jUI4ml3Gz0r7zPY8NUa5hTX5yfo958NGOekL/lgTWM8kzEK7fxerV
         Xz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742031709; x=1742636509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzNAXBvMCkEVkeIQmxTZZJktEMMoSHZ3SJ4jiX/ukqc=;
        b=IFAGbcu8pqRPUAxKmI5MXQ3TQnLIHTMuWqFscrTzl+MUKD/Ay1SJl30n5k8INc26QO
         Y+O1sOvv3TwgpIene8zf+we1xKMslZVnNf2wKrzi0BBBam0gDMYqWgP2ff6+Lt06xLyn
         dDWl5lj2V+t5yxrd8sEb8sTsvF+BxdgSMMwUHXlZqnisRpzFu70hBgwOri+egjM2XFMe
         XAUJ85VyxMuKEUZ+WzuaXI5rgNWV2igfJc7JV4fEC+FcnviKDDD+XGkUJTvSeffbuSzb
         nJ4pJFrhzH7PXw+02BtpBRuLwaqwH6maTQIseLVt/G38g8gbhYjurBnBtE/Eyv350M6o
         HCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzh969s7JFrtHc052PzuL6UwC/JiwuCmMS4MEx44v9oiZ5pbWI4BIvKul/1z5vYX5ueCbDMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8o8GyWJCYcEJTexlxuEDwvQU3zlajxSY3HHXc+mplw72cQ8fk
	qxRTTjQ3gqyjOgOX4oXgNIxgyt6S4bLwCFpr8ZIvpdhp08D3lvW/O5au4N5a0wY=
X-Gm-Gg: ASbGncv/0JVWmcKhyxipwxXV3zPBm+sHSvVI4OM7UExeM12afViIWQ2nOE+qtj5Plyz
	MkHpXfrzU4w30xOKlhCW323HTe62HMbkwsafiK/THSvWN36Xi9E1FkoEstsTU3+gtm96pbEBcVO
	MBBKlW107niW6+/7hp2NwWK1uSnijhu4I6SelKQ9fiZEjOYz0S2EDwMGpFDBMns/Sc7MZnIMaQY
	NQoA53rQAqtpzBvquae4mMQHdQkeq9QzFGQpjs0w9Qvg9jOnHz12QCoXMyApAXrLq0txq1Qr5ax
	xl5xNQWJ8d9joDz2t0OG7DT7qpqw3UXTqPNfn2kOVyW0mHNI5w==
X-Google-Smtp-Source: AGHT+IFTBJSfFex7i2l1+nA+IaHmXgFH0CMrehfzJSLe3f4uOTcDt6OJFbpTBxUtCAJY/pAU7os+/A==
X-Received: by 2002:a05:6000:186b:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-3971ffb1eccmr6108911f8f.45.1742031708881;
        Sat, 15 Mar 2025 02:41:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb318a3dsm8398500f8f.74.2025.03.15.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 02:41:48 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:41:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, tytso@mit.edu,
	ernesto.mnd.fernandez@gmail.com, sven@svenpeter.dev,
	ernesto@corellium.com, gargaditya08@live.com, willy@infradead.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 1/8] staging: apfs: init lzfse compression library
 for APFS
Message-ID: <51af0391-4dcf-434b-8c10-8682ab4a6179@stanley.mountain>
References: <20250314-apfs-v1-0-ddfaa6836b5c@ethancedwards.com>
 <20250314-apfs-v1-1-ddfaa6836b5c@ethancedwards.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-apfs-v1-1-ddfaa6836b5c@ethancedwards.com>

On Fri, Mar 14, 2025 at 05:57:47PM -0400, Ethan Carter Edwards wrote:
> +static size_t lzfse_decode_buffer_with_scratch(uint8_t *__restrict dst_buffer,
> +                         size_t dst_size, const uint8_t *__restrict src_buffer,
> +                         size_t src_size, void *__restrict scratch_buffer) {
> +  int status;
> +  lzfse_decoder_state *s = (lzfse_decoder_state *)scratch_buffer;
> +  memset(s, 0x00, sizeof(*s));
> +
> +  // Initialize state
> +  s->src = src_buffer;
> +  s->src_begin = src_buffer;
> +  s->src_end = s->src + src_size;
> +  s->dst = dst_buffer;
> +  s->dst_begin = dst_buffer;
> +  s->dst_end = dst_buffer + dst_size;
> +
> +  // Decode
> +  status = lzfse_decode(s);
> +  if (status == LZFSE_STATUS_DST_FULL)
> +    return dst_size;
> +  if (status != LZFSE_STATUS_OK)
> +    return 0;                           // failed
> +  return (size_t)(s->dst - dst_buffer); // bytes written
> +}

You'd be better off doing a reformat of the white space before sending
the driver.  The really basic stuff.

regards,
dan carpenter

