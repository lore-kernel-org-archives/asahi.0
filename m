Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E192566DA
	for <asahi@lists.linux.dev>; Fri,  7 Mar 2025 20:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741378301; cv=none; b=KuZi+vzS5aTjO4YvSUirWjVimqW3byL5/SAvzq9rlfY6fnnIQlOlvgn1LlEM+PctUU3p9a85KM4z5ydd3oMkXnMIO2M6ExL6yolHiiF5n/d+wehtr9XmDnPqkxiXnQigwOqL8X7gRWvJ02jfd22nYnqseFCfVrXD6nceqBJH6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741378301; c=relaxed/simple;
	bh=kvUDm8am0hSMA2w3XwH8qyN8rQp+p+otQyAY+cG40dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXYeGZ74eSkWYpL+zCAbK8kA+MkMZ2N3D4cvz9TUdlMilU4sXKtFFB2hZueA6Ru2RGzPPWfSWkeMW3cWABLB3EMOxxZ5oSpiOEv9cU/fF8FG2ihTneqEyaDxh8B47LHc20aJeROByTNmupYM0PaL1R/lt8/dZpmjE5r2M6eEnpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw6ndRIV; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kw6ndRIV"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f74b78df93so22865927b3.0
        for <asahi@lists.linux.dev>; Fri, 07 Mar 2025 12:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741378299; x=1741983099; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl996EB/BPN5hEnQtgwscpPDmaZ06UU290EobaQCcK4=;
        b=Kw6ndRIVzoRHSURLqlbe3j8Wpvidx+gP0qQU3xInPEjUV36wsOoMBcKuPctB/yzr95
         6G+HMecXAupKDsmxyUu4kuIN10b28zKrsLFzOvJohcB0i3DfB6c4HxdhYjU7pdj3lFFO
         zMh1TxP8QIIp95LNLbIe6VfTIODsG5hrorszYQFZERILSovDmmgFnBFLwBHANDotEfHb
         gAXGNqJEqjhVoT4AjPkhDokkbETday7klSU6TbMUU5mfBHL3ghdmjiCV/yzMpxcmIPc0
         3ai6MYwtbgLXHLjXRG2rqOJEsaJEPCRAIGxE8srYQ6GTF9JmzvoiUB7d3U3VADxiJeg5
         CYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741378299; x=1741983099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fl996EB/BPN5hEnQtgwscpPDmaZ06UU290EobaQCcK4=;
        b=YoxqbO14wHO0svkMNa1qrq2s2OyBPahn85wnTbBrSmfoqEpKYPXpJFlLYbJ0mZ3OAB
         WK3WBRjVaVrhjgo+MnDHVQreAfRLAQl+nitZxE+c6EVmyH3bBegXePKsdyspKwYdHYDS
         jXAUOr1SCXq2Dwhu2OSbR3hrsrhl8ozbgCEPK0Sx+B+nDHeV9oziuwETaxPGmhtvkQkM
         /FWi6GZxJPCuvgAKVzDaWAsvIA+mBMmyQQkEJl9885F3jXcpyxq+tyd0RPv8oEx5ogR+
         rRGS56yFVveEOuspSIdvMEleFHK4ZOAJ7kPN861AjSfNqOdAgmxFxfisxYzrIUpGgU3o
         5QkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy1x84Ll0r0a70Er9dASH6eD/bedqlFfJwy+r7oOj3gIYR0SpZmvI0+B5o1QnZHIEH1XID4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLMs/5SWia+7JoE7DXIb1xcbFitXsGScL2AxtCyPvxmJ9LjioQ
	DSIAI6XONF6obfJAjToDOd+/c0DbJJAt6iuXH9JLVLEXKY+0CXauoSwXjd7wlQKhZbhktOnoWrJ
	R2nISqb/BNHm2+xZc9ry/8XzLOcw=
X-Gm-Gg: ASbGnctCmd1cObzQ2R1/ixVCBVC15Z0CW/3rRMOLfUEyg9/l+1qxxa+Z6AJIk09Vrj/
	K2043K9hxf+q1de7yyD6oPl/ka8QMnBJypIDdcEXplHE+arLYWHEs91V35rmyFKpWOyvdHjD7qM
	6i7jhJXjxDqUuwi/ngP5OznUjruzQ=
X-Google-Smtp-Source: AGHT+IG4pG20Yrepe041wDSG8GJC3NZSymhx3boOCHZlIMGASclrEFPEzLQZrlRc2a50xWaYhD2crUw3xuwpdrKBiYM=
X-Received: by 2002:a05:690c:67c7:b0:6f9:b12b:8943 with SMTP id
 00721157ae682-6febf2f3a9bmr72669737b3.19.1741378299319; Fri, 07 Mar 2025
 12:11:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
In-Reply-To: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 7 Mar 2025 21:11:28 +0100
X-Gm-Features: AQ5f1JpZohgGftYZeUPmd7mjaK_v2MjyriIGwTdsUOZcHqxqIzREXd76VJK0afk
Message-ID: <CAMT+MTSHT92Q=Xm62zfDgTnR0MEw5gKEk1rmvmrQSbXgQbww_w@mail.gmail.com>
Subject: Re: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Janne Grunau <j@jannau.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Neal Gompa <neal@gompa.dev>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Mar 2025 at 10:31, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The __drmm_universal_plane_alloc() function doesn't return NULL, it
> returns error pointers.  Update the check to match.
>
> Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")

Acked-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
