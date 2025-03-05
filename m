Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE71C6FE2
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162662; cv=none; b=Dtc3x41Q6A2MHRcS9S35RJx9PVmPlRgyZO6INe4+0oo+TzxkeUvMaNbBWbVe7s7gKL+EmqE4+J4TgtDuIbj9tmA32Eoj1sej3HSDaYxEj4LUjSnY5iGu6bO1ENuHzzMahZHRK/XqJPXNQe+riOpGCfoOBDOk0S1AGFvBpsNIs80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162662; c=relaxed/simple;
	bh=unUXlRhpi9sFgYovBXVYDRg89FpRhkYUYq8VvpQ6o9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5f9X7ZOneX9u+CvOpODpbJ+HqaboC/YguLVKaq793KXXXGo4aLr1rlr/eLTufRUXvLu+1Vyb2/ejVkOhXyVQ4mEdvs1UqWx7yI1RWjLG53LtI/nvoLdzWrMD5wRPvKArXIsNOygS6938O80Hbz9QuWVloy1chcEviIlcer6SSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIVrAS25; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIVrAS25"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f4bc408e49so59042907b3.1
        for <asahi@lists.linux.dev>; Wed, 05 Mar 2025 00:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741162659; x=1741767459; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unUXlRhpi9sFgYovBXVYDRg89FpRhkYUYq8VvpQ6o9I=;
        b=GIVrAS25Dp32pLnHnGnPOffULhUqLtQr0xpi31C3iDGnwA7+EJJonJrRSKL3rZYurE
         AcBRCdFAyxSJpXQzeALNjD58puqa3nq8r4eqYUp5Sw0vnqLmlcGwlNo5oEUoyTMeSwli
         WRsQ4L3yU4kn4z+0x/GegUj5VNnHIeYkSk5QY71xXPdO385+5IpDf9uXjejrze7pOnMN
         D6MIPdj8pW0zSnBShn4tGXGPVJ0wA43RuRHTXKC0ZeauiwekeZlRV3R5LtxQJ9jX7lcj
         uh3GDNlXID13iQJ7lu//WBB0UfJcHBRcAHq0LLIjB9yhdwZ3ljgLUVx4v/OEi3289i4b
         tk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162659; x=1741767459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unUXlRhpi9sFgYovBXVYDRg89FpRhkYUYq8VvpQ6o9I=;
        b=sxCRu6/YHZsGaQOQer/bRvgYZuF1tjn09sHu83lyIFAPhMBViBD3Y4IdIkQtn1qHi+
         ve/R5HvdMj20c56obkFIU3cFsjOpcEdtVSa+HCDKxJeN4Aamb9fnZK9KgrJlS6NkmvF4
         UMYJkRjhgztSkeVmyVopT/iCyFTbhbNJhwI5AZJtbR1YlbBznwnp3APnp3/7DSrK11um
         tvvqArUyBVAOd/Z6Wz083q813fpheltzU5EhaIBFvRE8miTx4+q7bGpSsAex7RkmpIb5
         RyXsVz++dJK25cG4hHG4nIIvS1oAjUD1fJUE8be3BrVn8Ryjj8Y6IWhbyR5Ux1cTHasu
         3L/g==
X-Forwarded-Encrypted: i=1; AJvYcCUQW+50a7/tZbNtI/QoV5CUcYcGG2cr8dInIwAMQepEE8wneKmHjZBL8gFDBi30YHyKkI/VvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweeBYu7olzy2ey8rsuyIyqGNkXaVPoOgg/N4pD1MVf5+ZqWfTQ
	xaK6Ra+Zh6LKC81qWfrfsYAN9aT3PSptzrhYj43anGxHc/rVEn5isff8qS3Ib9wICZ6Khx0AlPA
	A9cwo+bUpDZ64vZlw1qfUKOAApvU=
X-Gm-Gg: ASbGncufgbv9TpU+KhIlDv8BNWb30DXgvVFK7wh8ZFMS+xfhYss/4pgAg0MdaAchSVp
	XMqN8Q4KuC3nLHU/5OZCD3Y1UUt4d/vpVeieAwoyXQ/vZataonDO/SLvwLCOMg9EISIbhtRHso9
	mtA9G0gIgvFbAnuXESVIvdTWLD+b8=
X-Google-Smtp-Source: AGHT+IFH8tbkdolKMFQTBXwdPnhgEhIHcppznLYb0q6wu6PUrmMI5mnzlfbW6CZYpCojAT11BsO0ndoY1bNLhWNtILw=
X-Received: by 2002:a05:690c:7307:b0:6fd:4670:80c6 with SMTP id
 00721157ae682-6fda30fa282mr29688317b3.37.1741162659401; Wed, 05 Mar 2025
 00:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 5 Mar 2025 09:17:28 +0100
X-Gm-Features: AQ5f1JpOTyDvXY3v1-JU3GbIR7BXMVjAHB0DwpN4ZcbevKt7RS7qwVJSQh96pnE
Message-ID: <CAMT+MTRvuYGqfNEO-uHK7zcDWR1z=iMJ2kmK_-cQ+i3i1=7jaA@mail.gmail.com>
Subject: Re: [PATCH -next] drm: adp: Remove unnecessary print function dev_err()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: j@jannau.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 03:06, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The print function dev_err() is redundant because platform_get_irq_byname()
> already prints an error.

Acked-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
