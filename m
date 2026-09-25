Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DB313E36
	for <asahi@lists.linux.dev>; Fri, 25 Sep 2026 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305917; cv=none; b=okQJ3CAW9rZy8GJGT6kSfVKnVnjkXqvqhrfJxTVFtvqZmbxtjt/K6j27/v9XsGs+Yz2wnoZ4S8SmzyNuFltuiFh2+s+qtcytHA6jhEDGAu2yWkoY56KOKngfedPIQl6TYk1Vd33ouPLJtv1i0CxIHtrCTeCAvzkFOuCNucbr5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305917; c=relaxed/simple;
	bh=d5X+0mGIr5O8jmugP6tkVpOw8QahBvvE95JE3VMBuPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiA8NG8pE+OiBvUAzp/kt4HhA1ex1rN8mheXRImnQmwM2Xmkpfnj9odZ6zfLdehc/d2UjCeYA0FHvUYmN0Px3uirflX30tXRWlWVRLUpSACMVD2E5WlZH00+KNeZvMAYC0wgAB6gZue2HEXpS8puKSHLIyumIHLJ/Hw7q7L2eZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9oTc4T6; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9oTc4T6"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so267269b3a.1
        for <asahi@lists.linux.dev>; Thu, 24 Sep 2026 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790305916; x=1790910716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=Q9oTc4T65tDPXYRGXIaN/ez5fMHDlQv9SjyIyMJHDdLKq/s7dqNKDc4XJaVBZerlRH
         DPw0QDvyfAHJ4MvuIFG2jjQLyzvVW+PQgBpQdNKRT+gu0ibyIeQ51MwRoGlGA6INsSrx
         VVBciipyXqqwK4kDbDyvsLK2pXtvFQAuK74R5NuzvVdlyafo9+MPQRA7HnIK+MRJPAPk
         reNYX7Z76iM+98mZG0uEZsRG3Rkd/CeqR91SCjfE98kReL/FK3ryWJwjnChCM+qaeieZ
         l47umKF3ZZDRJ7Fja7z3xacgz+j93GBUFaT2nZ7tzvSXzOgy+844hFeKn9btGwJP8tAf
         nteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790305916; x=1790910716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=w0HKDUWBwbZl2xljT8Y3CHpK0TW4JvZxb18zumvqTq60J37/FXp/we9eA6Uf0FJnVm
         rvYYMxMwQVX5XULXLmpgipFX0KgnHuFj3iWWE3K/rX/ktce8gzJP9tU0b9cbgRYYc0U4
         dIzM8GSvOv8EDwmYWCcrm9fYIG5sktM4YtiAnDGP+tK3LUGTuKWb21cYfCYDuf0G8DTN
         9aRFU+GJ2VOogH99f+6ix2MdWMbiwefEPxrRRrZ8cd8vzSkZ9FM5s/uwx2XM1+6/U+Io
         JPeyxozvMMDCQLLHyCyrn5tdDqvb3dltQfTSRESohYbC/SVXDj7XhptH5UFK+G26wnHy
         MLGw==
X-Forwarded-Encrypted: i=1; AKwUvBy4PUfGsI5lJxMH0jsbDmqnn7sWcqBaG6FnGukk5bQCWdjhOdpGSaNbteThyYz7HHQfjD+95A==@lists.linux.dev
X-Gm-Message-State: AFuF++kg/TxCnpP8Pawx+f1FxlMwqpuQtOW+V/TdDYgTnkMlrr6ga6pS
	C0N/pwrMSz09YlU2OxlwZHd4gavdDKKjGpShnKBFGgxguxHXlvUXDiqB
X-Gm-Gg: AYBFou1Zkndg4kGrZ98QJwxllygdMn3OZLvXWAMSOu5StIj1JrllhkA2anYgbpK6kge
	J1zifOMc/9u+fNtmnLu26TUfn9+HwNrQdG45j6IwvEeV7jWnBOORkxju6xYv9QbBhiB00xtDD54
	7a/ITwK+ohbYLpmtcaRcT+8ewPbNDi4Qe+QzDaiy8/qsGu0GzlFIjhwJ/g5+8CVcm7srcWL6FP+
	gBRVOO/dvu2dAGC0hNk+12oKO7O/wOdUrBjk8IOoqF/ZNesulY3b1hWuY8FZSpSemHH8LNv1Epm
	M7NjpOtX4UZtP8h4OJwRGWBKuMsPqC8MqzeaiR8ddVDU4TCcwfQpLAVygvmUq43s9bMO55NJxiH
	BFLnBnPaSm2Oyu1oJd4WvJ8P8sXz2NDJ9I4+WxZLc7j7cprAXRTlu59SFIdcYz7OvkUZg1E7RSH
	cVsFEfUxM+93d528I+OfoOCHsPF/aSecahPdHMoT9APNrNyTJGpdY/g4ss7JQTT4P7anGiJ8Pwc
	3KSfLibTIVE
X-Received: by 2002:a05:6a00:b4a:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-87e9995cfdamr3809048b3a.25.1790305915932;
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe82eb49asm408300b3a.3.2026.09.24.20.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 20:11:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
Message-ID: <381005d6-0aca-4d71-a08c-58aa7da7196a@roeck-us.net>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
 <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>

On Thu, Sep 24, 2026 at 04:17:09PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
> M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Applied.

Thanks,
Guenter
