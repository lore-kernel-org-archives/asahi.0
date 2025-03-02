Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5814C9D
	for <asahi@lists.linux.dev>; Sun,  2 Mar 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740912925; cv=none; b=d4dfLtrtL4tjerxwdjDeBpKbh5wsReeKqYTwr+7SycupN2w02UoHFSSz8OqG/Wnn4sdts2nHGyFZ40WZb3YzbG36z3Ka09S+9VItoMyuUzcepAOpyPJrxmAWHAFjhhhIhPei7evBLtpGcxT127PuFH0CePgLw4QMVvguUXjetqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740912925; c=relaxed/simple;
	bh=YP9vFesE7FOkWTsjQeuOzqlZhTxpNdth3TwzKIctpts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBGtFXpqpcH2BM+JOc/143GBMDMikPbSFSs4d/CPyyhRf89XT2OuvmnYzg3kVxgNxH2ejRb576JATyb0O4rnN/yxY3YiK0x/jW5Ara96X+r9oEHkmeXI7wVTjo5NWZb6aNQ+41QJDANv4CYlUlI5doN8HRe5Xm8rdhmjeexYp2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qg/OrGqK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qg/OrGqK"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e53b3fa7daso530610a12.2
        for <asahi@lists.linux.dev>; Sun, 02 Mar 2025 02:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740912922; x=1741517722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVNL0sPyTN/JB4JKueVcudW2dTNqPhTdzuxyAD7JqBI=;
        b=qg/OrGqK4EA4jHnm1WDt35ARvH11Ol9bkLq0yT8F/GkAeqJIEP7paVkr9vd4soa3pn
         bvyW8h/0DrtsLvQyjTAtCu78bq9SWbmrczOXPeFGqKDNLwvF8KQt5pPGX0nAEMIHqj5l
         HQF6+kKSMJPKbFJX9joqNFR11Ku9fXythGy1kydzI35mUvCc0R2lxK6GWpTQYZ7LHeI9
         F3LjcTZVdgFyqMlIcgyC6yrTZQRnDZm6eDnmGRKJqBgDHvR3LV2IHc9UGjTwkc3BeKl0
         I6+ry2x7vzh9V12qDBCgP788bfABCqPybgkOme6deTQLGOA51mxN87hW2vrtPuwWwaqB
         ua6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740912922; x=1741517722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVNL0sPyTN/JB4JKueVcudW2dTNqPhTdzuxyAD7JqBI=;
        b=UhSY3W7/YdMxbglJXhoPQBZthw4tkqwGQMi978MeXECBn924WPKjsY98HHn12iaCnF
         d/AA6me4UU15CzRZKgNSvDoASIdbKMpRwcFsp0cuJqMFrNOkPk0jXokvDa5PpOjmiylq
         oUZ1Ul00iZiU0bLRun4vHPEdUWe2DCVSP8NZsfK5cgRPVuh2dMXN4c/t3VmdlEssZRnq
         4vH06EXB+ANJekwV4hliInr7u3i9B1mxgZgSvs0IBAG+X6u7mKCjkmNoaArajnXuQIBk
         ObKtVQKmLYavr7O/C+9sKkqsZyRq02XRVbI3dhDcN/xvYNHBRJr/chfXmm4+KoAP5iEl
         nkkA==
X-Forwarded-Encrypted: i=1; AJvYcCVrq+SB+8hrHmbYgnw3ng1HpzKpGR0K9NLs6BwCHRob8NCpFmw83c+9vbT56tMACH6oVUYd4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsd5+z8Qd7y4SqkUwHp9F041cXI7Ukn8BsvXrrZs9BJogPSRhV
	knDDyRHF/BKLIoOhSwhh5bztj2/D/avxH3yYMK0CUrJm4pdwVpnXecpTSh7bNVM=
X-Gm-Gg: ASbGncvpystyRPkKRUMVhUvXNsif/M+DX4F+HLy3Ye8WljtRlNVkKoYZuz10kvDNiCK
	utoteFHicPwKzq2gr125i0g2agRzAaBjiv+NStJHo5iEDVtPDnBB+G5kOA0utActJ0RMa3KiIzt
	w5mc0sA/gv+fjJTca7yYSKhuYDFFiTYxm3VQPbctUJcoSPUqrfc3IuE06FiCRRiS+b+Jw5shLx2
	RtVCw1CU4QeBfDjSiQGKJ9dymsMPZYAnNIQroaxMgFKyAx2U5x8RYEbL9Imt7Hqc1NXTZ+cYnhK
	SxREbtWV3ncNjFD2VcMLp1p061pqvb7/s4q5+CyNNV/1zEXSkw==
X-Google-Smtp-Source: AGHT+IF5u6hOznuueVO45DvOr3tnpJV+3iyHP7nKiHIBEz75iKNJU9mKeQvZWjwJzKMqMC7qM6j60Q==
X-Received: by 2002:a05:6402:3512:b0:5e4:d13b:e65 with SMTP id 4fb4d7f45d1cf-5e4d6af15damr10563438a12.9.1740912921716;
        Sun, 02 Mar 2025 02:55:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3b4aa46sm5309846a12.1.2025.03.02.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 02:55:21 -0800 (PST)
Date: Sun, 2 Mar 2025 13:55:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-staging@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [RFC] apfs: thoughts on upstreaming an out-of-tree module
Message-ID: <b9c2ce02-dab6-4b4d-b8ca-ac1e7769e0c3@stanley.mountain>
References: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>

If you're going to do a major re-work it might be easier to do that first
before you upstream it.  Once it's in the kernel then you have to follow
all the rules like breaking your commits up into reviewable patches and
not breaking git bisect.  The rules are good for quality control but they
can be burdensome for people who want to move fast and break things.

regards,
dan carpenter

