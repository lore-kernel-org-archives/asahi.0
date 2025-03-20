Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6A01AAE01
	for <asahi@lists.linux.dev>; Thu, 20 Mar 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742449171; cv=none; b=GnE1VsNMSK+L0yDbUJinkY3uDKilBSB5OBCiqRdnXEOcOy44c+VVrXAH6+aJ7OIm8UJBjv/j78rp59vwkCUx5qcp0eIjEamRl4TMahgduzeLkizWEccnj4NNFn3NhXzy/6rOr55m9J8cxkNCeOLSlmEG6ywZvLoNEsE/Oimpj6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742449171; c=relaxed/simple;
	bh=HSCSKfhfDD7I1zTxBolH/tzZ9w0jNV+XNDv1/LCD76o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaXoBejeTS+SiYxgbHunHr309KqNRtoOdSAaG5buTkoRyn5qrvF1b76QvNa/SH278jKOtxTUI1U6zQNi0iZcGpv6aNPk1Ks2JfTrTH7pXgpo4wOoM9PvZjyPCAbtiF02Doq8LmbDOrNxEejwcPv7ioU83vNvu37DNw5Z66OEJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ME/UOifP; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ME/UOifP"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390f5f48eafso144191f8f.0
        for <asahi@lists.linux.dev>; Wed, 19 Mar 2025 22:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742449168; x=1743053968; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1xfmCIlDCLZv6ta1QqTTHp5D0zhqGln1AOW6eZ+4nQ=;
        b=ME/UOifPB9KvG0ohGdD+ACUiKU5S2E57LG8Cd4atKuUWD+dGqUcDxzNNVDBMx7zvgT
         W8rlOm+ERDsS3NgyqbmkMVdfC1Q4Rf9cEMcScJy1oHpL0DgOFeeYfG+Pgw0tuJ1/1iab
         7nEKKfeoWHat9qXXgdlY2wb1gzWFFwx9dFePeIjzFycHLwGlleV24S+ZNJAV/IgCTTdi
         8hKOTgBaT2VcmdVhEulMFEmiodRlTva8Ib23U+TKTY5QDDxvnNR92YOoOLuqx0qQ620d
         FW5aScYhOQD5JHzhTtdsXey9E0sH+6juY6DlwMdxNekP6Yott9YuLOZh4XB48nogjb3z
         6rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742449168; x=1743053968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1xfmCIlDCLZv6ta1QqTTHp5D0zhqGln1AOW6eZ+4nQ=;
        b=YX6lg5aoIIl4ogbrOW+ALVgRAnD0QqanthnjTbIjFa54OVN6dU4vyCofUSmuP85LOk
         9oKxMxGtCz62ge+3QNrCR1qeYBitIeUoXzW3XsqOwADsKTyO6EL6aOvITSFG9wSZKOh9
         YxMlmvceDJjT8EeFHbxMfZmWu+PRXGS2BsMITwwUmNPo1rP4JrgEZmd9BtEpn5YcD+BS
         JekgualIZI4QW03ZWOUe13ZSHV3RR4/cOd7XIAqTSWVX8FDFRUNSOV5xefXiBP5zKUp5
         RmSe0wAFMmKvB51bKnLjEuY9jzSsiEYXG3tDLFcE4sSTforivc4bXeVWz+tV2BrsWamv
         6w3w==
X-Forwarded-Encrypted: i=1; AJvYcCUf3EIzRSohe6QEkNw7NO46Mihkr8E/L0QQ5MIw8NQEQN3VkMrIhYUusroKPWo1EmYNeAXuYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAFe/57Pf3rHZdV6coljvS2OO0hAHAkR79ekDQyAr285NNozL0
	Zq8ouROfX1PmMD86PzvbeEv6HHyqlb/33Cwz+uJ5Ft7ATTZpaxEuNkW7rqIJ4Nk=
X-Gm-Gg: ASbGncs4DSR5mATpJ+MMHcGrpI22Vrx0hUWH0q5wOwpo66EE5jMkE0T72BVbPXKKE8+
	fd92nG0HiJnxg7HFvUxcptHsWsRyFMHPsOSv7XPw6yJ4c8IvpdoQa2z2v2duhMaLZe54Dafa1de
	FnaGS1p6mvP9GG7mgo8Xviffgoho1ITSGnqH6MzITuWiOsABlqJbD1QeNWfyyZQ3YyB5UbpU9D3
	gHvL7ihTObGfrHCSoOfVRYE2avhOmyf6mS3hXK1MZDX7OwW/xzkGWQhXKBrkT6jjXRDb5uC45s5
	RbFgtzHpcDaE1hg4vr99CLbBW3bkHyWFVeyMVSg1vjzxTiapOA==
X-Google-Smtp-Source: AGHT+IGQzpC9EimzyS/t+4sa9m1WxjhJGJdtlCwpcWgQVOt2GkYCyDGik+tts44dUuzfVSiwyZSIYA==
X-Received: by 2002:a5d:5888:0:b0:391:231b:8e0d with SMTP id ffacd0b85a97d-39973b32bb3mr6150923f8f.39.1742449168214;
        Wed, 19 Mar 2025 22:39:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c83b6a10sm22976809f8f.36.2025.03.19.22.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 22:39:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 08:39:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: brauner@kernel.org, tytso@mit.edu, jack@suse.cz,
	viro@zeniv.linux.org.uk,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ernesto.mnd.fernandez@gmail.com, sven@svenpeter.dev,
	ernesto@corellium.com, gargaditya08@live.com, willy@infradead.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem support
Message-ID: <541236f7-adb5-4514-a888-19fef74c14f0@stanley.mountain>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>

I don't think this filesystem should be merged.  The real upstream
is out of tree.

regards,
dan carpenter

