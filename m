Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BA199FB5
	for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597179; cv=none; b=YX7sudjsXYosuiNTal6OgMD6pXNHuKkBKw/JMeeGp7pi9TAUNyEWZTt3EOG6ECQCwMUnSNyNmDc8qVxR1A5M4or+q+lKvYBBxDOyqC+tfyAYusfRYZvKRRQr9qsZuzV1ut9Nsxet7aTaPnFz+gkTstN8pO4owvoSHVHqr1caogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597179; c=relaxed/simple;
	bh=Q7UvAeo7wgj55k0tHHcaQIz89W2aiZuE9pPZIebFQSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf1kkAJ5IMymbt1TvHOi9mGQmAjFPjsD8s9Lg/wkB/Dx0a9OiQsgRlHCM3FcTPCNxpCGVQ5RMqfI2xfPuoWSZoyaYRpBvbeOoI7UFyPr6UdsADwfIdQRQEZBPKwflbaAhxPDAEx8Wb9TDLCVGCewDYy5BgvUxjfWDG7nSUgbLIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E7i0Myaw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E7i0Myaw"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso2280220a12.3
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597175; x=1730201975; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VdmnWgCwPxxjygGThsGOmIi6siTSsGy/bxkMND48qlU=;
        b=E7i0MyawDBGIil83C7JZJMGOn9Pj0zAqNnBUl/8nUig/Yij6X5QOrvWaGVxlx0aL9f
         BRfxPfN9710HdsevX/K5YyChPv0AjWo1/mCaU2h8CYyznKCl7CU2217XF6sifqYzEEHG
         rDN8yZz8N4nyWJoz20WD/aZ3SX569u7kB2XcOxn5hpHQhkddfvMoqkbK98yeRy15ki6E
         z5Ju8WK45eFACSZzz2kMfJ+MQmDozqSEeyoFcma2w7VKUEkQmzg5y6lFRUgAjbut/0i/
         +HrVCs8weJ9rpKAxeVrI36sLhm7cXRkt2MqCy66T9ZDk/e+LHP179Lu+oZakrI4pGLWm
         DvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597175; x=1730201975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdmnWgCwPxxjygGThsGOmIi6siTSsGy/bxkMND48qlU=;
        b=dryrS/vhF3/KodVdIscSBEAG6lKdZjXDFfD1qT5yG+JNg41xj+VjvPG4QwsZgWcEfp
         7hUov9QbkPqEsYBaVrcfEbTAzGxaA0LQDcEBKS3QNBphbKLExTpapkxjRRMATgtTUD2t
         m2FGccIh9G+GSUpPGARsybMQWfwojN+LvOTGlrmlpguTpE48NBfDMsyk5kSxUWHRNWPW
         Cq2jLj6+J+MV/KxQl2CzGX+WVohdbZGO6viWUA8JIOW1I94STXAhnKDnAWNqrBmNa+br
         u6yKBQlWAGE6Ax4aCrv9I0kzYrgpNPtb3e3jKArPARnFOBpH89x5uPs9ihcx69L95pmo
         /snw==
X-Forwarded-Encrypted: i=1; AJvYcCWEtPgZ7pOAOP0g5amKIHWDhZ1JDbiIRwoD24xJB7Z74CMpH0bqxqLdRqUWjaTrMOKU5qdeKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy+q64nKYTMJk2sQcVnt675ZB4vKVIYkLdNkc2+Vi2iY+X1o82
	SaJX+5zwUSX5EoDMo5HKZtzyZHOkTZvUXfUUIh60PD6EbOU9ra+eJoLZFKc5X3g=
X-Google-Smtp-Source: AGHT+IFwOWA+ThxyNU6js2FSv7eSZcv26U7aBvfGZRHfZ7plL8dQmDR2VvtmtU0l0YIs/RmLPfk0xA==
X-Received: by 2002:a05:6402:370c:b0:5ca:e5b:bbdb with SMTP id 4fb4d7f45d1cf-5cb7fcfdf2bmr1649962a12.18.1729597174872;
        Tue, 22 Oct 2024 04:39:34 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c737c4sm3006495a12.96.2024.10.22.04.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:39:34 -0700 (PDT)
Message-ID: <5dd0af61-05c7-4a17-8fbe-31a317824ad6@suse.com>
Date: Tue, 22 Oct 2024 13:39:32 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/19] gendwarfksyms: Add a cache for processed DIEs
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-26-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-26-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Basic types in DWARF repeat frequently and traversing the DIEs using
> libdw is relatively slow. Add a simple hashtable based cache for the
> processed DIEs.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, free free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
