Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4321ABC6
	for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511657; cv=none; b=gp7iEJ/XbFdNKcfROEitqKc2fMmv6ucUN93x+yjRbZtcz3NUqMETJSHYs9ytMSCDIxs06qYXKPAAyqWuU0Gr2E/9b1Y1cJe0AhBZU0mJkZdzmidaDimsKzv0P9TfLEfZ125yQTyVQQbtYSxRTdI6ZpRIu7vn3hY7B9Zzdxn4nns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511657; c=relaxed/simple;
	bh=zdaV+3Ywbo5HbnXPfU6splKF+KIBRUUTFf17H3ea9dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8BECXANt6OXPF+8gAk6bc7yTKnhA9InBKfoSEBEakGjDCH3f3AlnKAi7VBPFxtmH+hcDR0K/Ek1TnlXU+WS2pDK/rK7ZcT0QWQ22UgS2Bb92bGei23A/5xZLEazAfKlm4Zj5TwLLTAnEixwegNzJVcDdgqVrlyf+Hf8C1hskXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnhRBbiP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnhRBbiP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2212a930001so52200625ad.0
        for <asahi@lists.linux.dev>; Tue, 25 Feb 2025 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740511655; x=1741116455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C5SO+7/ep0j/owc8WrmnlAPtfqqgd25aSeIIb1w7NrA=;
        b=TnhRBbiPoFaTvdrffybiHbsA6tfmO9qx4Pzd4h1OnfVZbEQXzGT3hRJo/4nKxBHd1B
         DkqpdY3EBqe2i2PeSy3h4YNoA7S7WSCXAAzxIjlWNnHxrBU1vrA+qll5lz3AnQ91cXqK
         CkkHg0PLm913csnvrPblZcRBbpBg6lQzyk9VggnNpjhjBctpqxz8rOPdcwm1Xzv6hg+9
         H87g8BaNxAVV6NFM/vqIh7LigW1zl03o+UhbSNog1oKbhQR2tOx6b60+ikcfrgskEzK/
         RFw80fn5IeOnJ/MkjQO5q3FsG5eizbI8uBC2LCnFhxfJqP7f10B8Yzx7Cxdn/hjT9zlN
         jCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740511655; x=1741116455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5SO+7/ep0j/owc8WrmnlAPtfqqgd25aSeIIb1w7NrA=;
        b=A2hlRJprMhjuRxmOBv5bIIojeSw7eBfjj18FLaqgM5o+Xn7faOQDut1kO6cIvlEh3j
         KKIktOvCQnJLX7FEgInIF+XngXPilZXdOdKDxGqokURyAnGN8/VN5gRo9/9c5ny7YsPO
         2UofNZV0yeBgubgi/WBmJq948pgm7w/8epI7dJNYX20i5WZw+e1eSLx9BBHRNKMh5tzv
         dtkvKYmAU+s8INS7NRR/YTKy2MhWpJzQP15MPriG8a/nCdEkKSJ7Z1PwALRuwP2HDFvm
         8elAfu/7Rjptaa9Aq09X8kkMNamPW37NwUI/bypJz+b47KhgFwCa4dajIDMUfQea9CE1
         G9bw==
X-Forwarded-Encrypted: i=1; AJvYcCVfbr9Yb18spMSDNAuttJtNaTF+d69iRrQDouXtPiuU9BjAGpHVzXlw+cxHYv2Z9ME+9s78sw==@lists.linux.dev
X-Gm-Message-State: AOJu0YymXokofKd6VQWjKAyGzuybmEDGd9g6uSS8ISzi/7Ogvf9Yzo1m
	W+tSXBbbZGRR8n2UnZPM3jvG/ejxc0ZKwQ471xviS+jkH5yrJFGHFle8JA==
X-Gm-Gg: ASbGncsaW+IZ5HAD1u17C8TehD6bkGejKkDCJ937rG6Wc9lIzsT5F0YWG41y/zRCnVJ
	yGWebo2EQmKoToBNlaa1ayq9/6JaC0UUh4KcZjWWm2gG9oimSspOM6eWmQryzYbrpfE6APxSye8
	RJHv/FmR3u3/HSP2Sx0rPadbjHh/MM0sA+6pjArh1S6/1XlKUmTHjEPL2kZ/dBEg+lXg2kkSgpF
	zYspLFoc2D0tnJ631DfZCa5ImQ0rrP2p/8nMMTu2KaIqTM5C5/041N2FQC6Aryj0rBunaJ0PwTe
	YLZPUBl7ft0+e1VLgok/8bWAHvw=
X-Google-Smtp-Source: AGHT+IEqSuUqr9dv8f0RwH2FZL2RwCXspaXOEwGIZTwj3CQdWQj6g02qdmxYcGheJFG6nbU/pscZwA==
X-Received: by 2002:a17:902:daca:b0:220:c164:6ee1 with SMTP id d9443c01a7336-221a1148bdcmr297622065ad.32.1740511654831;
        Tue, 25 Feb 2025 11:27:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0965cfsm17946225ad.155.2025.02.25.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:27:34 -0800 (PST)
Date: Tue, 25 Feb 2025 11:27:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] input: apple_z2: Fix potential confusion in KConfig
Message-ID: <Z74ZoyMCHSkKQK6j@google.com>
References: <20250225-z2-kconfig-v1-1-a67d9b778a6c@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-z2-kconfig-v1-1-a67d9b778a6c@gmail.com>

On Tue, Feb 25, 2025 at 08:48:24AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add a dependency on ARCH_APPLE and clarify the description to make it more
> obvious that this is for ARM machines, not x86 ones
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry
